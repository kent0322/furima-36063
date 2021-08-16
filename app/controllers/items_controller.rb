class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :create, :new]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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
    @item.update(items_params)
    if item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  #def destroy
    #item = Item.find(params[:id])
   # item.destroy
 # end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to new_user_session_path unless current_user == @item.user
  end

  def items_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :load_id, :area_id, :days_id, :price, :image ).merge(user_id: current_user.id)
  end
end
