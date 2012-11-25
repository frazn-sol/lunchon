class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.integer :purchase_id
      t.integer :deal_id

      t.timestamps
    end
  end
end
