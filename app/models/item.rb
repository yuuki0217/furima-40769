class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image, presence: true
  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_origin_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
end