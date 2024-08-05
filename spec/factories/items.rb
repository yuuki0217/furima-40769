FactoryBot.define do
  factory :item do
    product_name { 'テストの商品名' }
    product_description { 'これはテストです。笑' }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_fee_id { 2 }
    shipping_origin_id { 2 }
    delivery_day_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
