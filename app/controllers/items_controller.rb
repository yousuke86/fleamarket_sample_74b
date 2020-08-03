class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
  end  

  def purchase
  end

  private

  def item_params
    # seller_idをcurrent_user.idへ変更すること（三輪）
    params.require(:item).permit(:name, :introduction, :brand_name, :status_id, :postage_type_id, :prefecture_id, :need_day_id, :price).merge(seller_id: 1)
  end
  
end
