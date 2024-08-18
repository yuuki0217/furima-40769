FactoryBot.define do
  factory :order_address do
    postal_code        { '123-4567' }
    shipping_origin_id { 2 }
    city_town_village  { '横浜市緑区' }
    street_number      { '青山1-1-1' }
    building_name      { '柳ビル103' }
    phone_number       { '09012345678' }
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
