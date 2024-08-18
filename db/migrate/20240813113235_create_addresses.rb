class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :shipping_origin_id, null: false
      t.string :city_town_village, null: false
      t.string :street_number, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :order, foreign_key: true, null: false
      t.timestamps
    end
  end
end
