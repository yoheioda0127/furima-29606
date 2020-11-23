class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  private
  
  def move_to_index
    unless user_signed_in?
     redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :detail, :category_id, :condition_id, :ship_cost_id, :ship_pref_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
