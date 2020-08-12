class ItemsController < ApplicationController

  before_action :set_item, except: [:index, :new, :create]

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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  def show
    @user = User.find(@item.seller_id)
    @status = @item.status
    @postage_type = @item.postage_type
    @prefecture = @item.prefecture
    @need_day = @item.need_day
    @images = @item.images
  end  

  def purchase
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
