class ItemsController < ApplicationController

  # @item = Item.find(params[:id])のbefore_action（三輪）
  before_action :set_item, except: [:index, :new, :create, :purchase, :get_category_children, :get_category_grandchildren]
  # 出品者以外は編集を許可しないbefore_action（三輪）/後ほど：destroyも追加
  before_action :ensure_correct_user, only: [:edit, :update]

  before_action :set_category_parent_array, only: [:create, :edit, :update]


  def index
    # @test = User.includes(:sending_destination)
  end

  def new
    @item = Item.new
    @item.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
      # binding.pry
    end
  end

  def create
    @item = Item.new(item_params)
    #binding.pry
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  def show
  end  

  def purchase
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :brand_name, :status_id, :postage_type_id, :prefecture_id, :need_day_id, :price, :category_id, images_attributes: [:image_url, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_correct_user
    @item = Item.find(params[:id])
    if @item.seller_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

  def set_category_parent_array
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
end
