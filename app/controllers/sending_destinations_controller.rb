class SendingDestinationsController < ApplicationController
  
  # validates :destination_last_name ,:destination_first_name,:destination_last_name_kana,:destination_first_name_kana,:post_code,:city ,:house_number,:buildingname_and_roomnumber,:tel, :prefecture_id, :presence: true
  before_action :check_user_signed_in, only: [:new, :create]
  
  def new
    @sending_destination = SendingDestination.new
  end

  def create
    @sending_destination = SendingDestination.new(sending_destination_params)
    @delete_sending_destination = SendingDestination.where(user_id: current_user.id)
    if @sending_destination.save
      redirect_to root_path
    else @sending_destination.destination_last_name == "" ||@sending_destination.destination_first_name == "" || @sending_destination.destination_last_name_kana == "" || @sending_destination.destination_first_name_kana == "" || @sending_destination.post_code == ""
      flash.now[:alert] = '入力内容に誤りがあります。'
      render new_sending_destination_path
    end
  end

  def edit
    @sending_destination = SendingDestination.find(params[:id])
  end

  def update
    @sending_destination = SendingDestination.find(params[:id])
    if @sending_destination.update(sending_destination_params)
      redirect_to root_path
    else @sending_destination.destination_last_name == "" ||@sending_destination.destination_first_name == "" || @sending_destination.destination_last_name_kana == "" || @sending_destination.destination_first_name_kana == "" || @sending_destination.post_code == ""
      flash.now[:alert] = '入力内容に誤りがあります。'
      render action: :edit
    end
  end
  
  private
  def sending_destination_params
    params.require(:sending_destination).permit(:destination_last_name ,:destination_first_name,:destination_last_name_kana,:destination_first_name_kana,:post_code,:city ,:house_number,:buildingname_and_roomnumber,:tel, :prefecture_id).merge(user_id: current_user.id)
  end

  def check_user_signed_in
    if user_signed_in? == false
      flash[:notice] = "ログインしてください"
      redirect_to root_path
    end
  end

end