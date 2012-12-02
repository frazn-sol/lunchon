class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.integer :purchase_item_id
      t.string :code
      t.boolean :redeemable
      t.datetime :requested_at
      t.datetime :redeemed_at
      t.integer :redeemed_by
    end
  end
end
