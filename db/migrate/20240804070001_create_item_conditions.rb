class CreateItemConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :item_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
