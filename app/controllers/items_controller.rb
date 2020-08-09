class ItemsController < ApplicationController

  before_action :set_item, except: [:index, :new, :create]

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
    @status = Status.find(@item.status_id)
    @postage_type = PostageType.find(@item.postage_type_id)
    sending_destination = SendingDestination.find(@item.seller_id)
    @prefecture = Prefecture.find(sending_destination.prefecture_id)
    @need_day = NeedDay.find(@item.need_day_id)
    @images = @item.images
  end  

  def purchase
  end

  def edit
    @images = @item.images
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :brand_name, :status_id, :postage_type_id, :prefecture_id, :need_day_id, :price, images_attributes: [:image_url, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
