class AddRedeemedAtToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchase_items, :redeemed_at, :datetime
  end
end
