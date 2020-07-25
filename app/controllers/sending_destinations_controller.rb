class SendingDestinationsController < ApplicationController
  
  def new
    @sending_destination = SendingDestination.new
  end

  def create
    @sending_destination = SendingDestination.new(sending_destination_params)
    if @sending_destination.save
      redirect_to root_path
    else
      render new_sending_destination_path
    end
  end
  
  private
  def sending_destination_params
    params.require(:sending_destination).permit(:destination_last_name ,:destination_first_name,:destination_last_name_kana,:destination_first_name_kana,:post_code,:city ,:house_number,:buildingname_and_roomnumber,:tel).merge(user_id: current_user.id,prefecture_id: 1)
  end


end

