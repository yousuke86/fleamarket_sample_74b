class ItemsController < ApplicationController

  # @item = Item.find(params[:id])のbefore_action（三輪）

  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  before_action :set_category_parent_array, only: [:create, :edit, :update]


  def index
    @items = Item.where(buyer_id: nil)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def new
    @item = Item.new
    @item.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def show
    @user = User.find(@item.seller_id)
    @status = @item.status
    @postage_type = @item.postage_type
    @prefecture = @item.prefecture
    @need_day = @item.need_day
    @images = @item.images
    @category = @item.category
  end  

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def purchase
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path, notice: "クレジットカード情報を入力してください"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を入力
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )
    @item.buyer_id = current_user.id
    @item.save
    redirect_to root_path, notice: "支払いが完了しました"
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

  def edit
    @images = @item.images
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end

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
