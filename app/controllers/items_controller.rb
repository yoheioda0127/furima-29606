class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end
  
  def edit
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
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
  
  def set_item
    @item = Item.find(params[:id])
  end
end
