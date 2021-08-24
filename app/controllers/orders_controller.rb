class OrdersController < ApplicationController
  before_action :authenticate_user!,     only: [:index, :create]
  before_action :set_item,               only: [:index, :create]
  before_action :move_to_index,          only: [:index, :create]



  def index
    @form = Form.new
  end
  
  def create
    @form = Form.new(sell_item_params)
    if @form.valid?
      pay_item
      @form.save
      return redirect_to root_path
    else
      render :index
    end

  end


  

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: sell_item_params[:token],  
      currency: 'jpy'  
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.purchase.present?
  end


  def sell_item_params
    params.require(:form).permit(:post, :area_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end