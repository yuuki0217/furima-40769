require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  context '正常系' do
    it '全ての値が正しく入力されていれば購入できる' do
      expect(@order_address).to be_valid
    end

    it '建物名が空でも購入できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '異常系' do
    it '郵便番号が空では購入できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがなければ購入できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '都道府県が空では購入できない' do
      @order_address.shipping_origin_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping origin can't be blank")
    end

    it '都道府県が1では購入できない' do
      @order_address.shipping_origin_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping origin can't be blank")
    end

    it '市区町村が空では購入できない' do
      @order_address.city_town_village = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City town village can't be blank")
    end

    it '番地が空では購入できない' do
      @order_address.street_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street number can't be blank")
    end

    it '電話番号が空では購入できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が12桁以上では購入できない' do
      @order_address.phone_number = '0901234567891'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号が9桁以上では購入できない' do
      @order_address.phone_number = '090'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end 

    it '電話番号が半角数値では登録できない' do
      @order_address.phone_number = '０９０１２３４５６７８'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end 

    it 'tokenが空では購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end