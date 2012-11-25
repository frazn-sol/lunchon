class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.string :cc_transaction_id
      t.decimal :price, :precision => 10, :scale => 2, :default => 0.00

      t.timestamps
    end
  end
end
