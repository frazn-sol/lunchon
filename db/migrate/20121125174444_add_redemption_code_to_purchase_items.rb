class AddRedemptionCodeToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchase_items, :redemption_code, :string
    add_index :purchase_items, :redemption_code
  end
end
