class RenameShippingFeeIdToShippingChargeIdInItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :shipping_fee_id, :shipping_charge_id
  end
end
