class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :create, :new]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
 
  end

  def edit
 
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :index
    end 
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

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user != @item.user || @item.purchase.present?
  end

  def items_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :load_id, :area_id, :days_id, :price, :image ).merge(user_id: current_user.id)
  end
end
