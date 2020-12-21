class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_find, only: [:index, :create]

  def index
    @order = AddressInformation.new
    if @item.user_id == current_user.id || @item.information != nil
      redirect_to items_path
    end
  end

  def create
    @order = AddressInformation.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def set_find
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:item_id,:post_num, :pref_id, :city, :house_num, :building, :tel).merge(token: params[:token],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:   @item.price,
      card:     order_params[:token],
      currency: 'jpy'
    )
  end
end
