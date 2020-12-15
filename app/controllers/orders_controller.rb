class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = AddressInformation.new
  end

  def create
    @order = AddressInformation.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
  
  private

  def order_params
    params.permit(:user_id, :item_id, :post_num, :pref_id, :city, :house_num, :building, :tel).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
