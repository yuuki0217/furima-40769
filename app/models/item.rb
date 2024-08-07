class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_origin
  belongs_to :delivery_day

  validates :image, presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_origin_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'must be greater than or equal to 300 and less than or equal to 9999999' }
  validates :price, numericality: { only_integer: true, message: 'is not a number' }
end
