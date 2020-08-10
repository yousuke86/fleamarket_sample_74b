class ItemsController < ApplicationController

  # @item = Item.find(params[:id])のbefore_action（三輪）
  before_action :set_item, except: [:index, :new, :create, :purchase]
  # 出品者以外は編集を許可しないbefore_action（三輪）/後ほど：destroyも追加
  before_action :ensure_correct_user, only: [:edit, :update]


  def index
    # @test = User.includes(:sending_destination)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
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

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :brand_name, :status_id, :postage_type_id, :prefecture_id, :need_day_id, :price, images_attributes: [:image_url, :_destroy, :id]).merge(seller_id: current_user.id)
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
  
end
