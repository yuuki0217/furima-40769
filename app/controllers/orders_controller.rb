class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create, :index]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_order
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Item not found.'
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_origin_id, :city_town_village, :street_number,
                                          :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def move_to_index
    return if current_user != @item.user

    redirect_to root_path
  end

  def move_to_order
    return if user_signed_in? && @item.order.nil?

    redirect_to '/'
  end
end
