class OrdersController < ApplicationController

  def index
    @order = AddressInformation.new
  end

  def create
    @order = AddressInformation.new(order_params)
    if @order.save
      redirect_to action: :index
    else
      render :new
    end
  end
  
  private

  def order_params
    params.require(:address_information).permit(:user_id, :item_id, :post_num, :pref_id, :city, :house_num, :building, :tel)
  end

end
