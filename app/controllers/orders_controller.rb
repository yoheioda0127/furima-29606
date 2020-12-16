class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = AddressInformation.new
  end

  def create
    @order = AddressInformation.new(order_params)
    @item = Item.find(params[:item_id])
    if user_signed_in?
      if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
      else
        render :index
      end
    else
      redirect_to root_path
    end
  end
  
  private

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
