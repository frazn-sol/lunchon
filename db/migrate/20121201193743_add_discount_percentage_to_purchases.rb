class AddDiscountPercentageToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :discount_percentage, :decimal, :precision => 10, :scale => 2, :default => 0.00
  end
end
