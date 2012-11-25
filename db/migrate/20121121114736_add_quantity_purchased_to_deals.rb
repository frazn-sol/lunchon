class AddQuantityPurchasedToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :quantity_purchased, :integer
  end
end
