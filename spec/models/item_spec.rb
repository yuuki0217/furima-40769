require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '正常系' do
      it 'すべての値が正しく入力されている場合、商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'product nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'product descriptionが空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_condition_idが空では登録できない' do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end

      it 'product_condition_idが1では登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end

      it 'shipping_charge_idが空では登録できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'shipping_charge_idが1では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'shipping_origin_idが空では登録できない' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end

      it 'shipping_origin_idが1では登録できない' do
        @item.shipping_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end

      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'delivery_day_idが1では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が、¥300以上でない場合、登録できない' do
        @item.price = '30'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300 and less than or equal to 9999999')
      end

      it '価格が、¥9,999,999以下でない場合、登録できない' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300 and less than or equal to 9999999')
      end

      it '価格が半角数値では登録できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
