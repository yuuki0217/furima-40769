class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_origin_id, :city_town_village, :street_number, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid" }
    validates :shipping_origin_id
    validates :city_town_village
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
    validates :token
  end

  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, shipping_origin_id:, city_town_village:,
                   street_number:, building_name:, phone_number:, order_id: order.id)
  end
end
