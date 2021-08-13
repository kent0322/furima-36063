class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]

  def index
    @items = Item.order("created_at DESC")
    @item = Item.new
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
