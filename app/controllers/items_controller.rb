class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit, :destroy, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(items_params)
    if item.update(items_params)
      redirect_to item_path(item)
    else
      render :edit
    end
  end


  def destroy
    item = Item.find(params[:id])
    item.destroy
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

  def items_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :load_id, :area_id, :days_id, :price, :image ).merge(user_id: current_user.id)
  end
end
