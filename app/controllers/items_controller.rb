class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:update, :edit, :show, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_charge_id,
                                 :shipping_origin_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if current_user == @item.user

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
