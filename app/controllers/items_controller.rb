class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order("created_at DESC")
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

  def items_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :load_id, :area_id, :days_id, :price, :image ).merge(user_id: current_user.id)
  end
end
