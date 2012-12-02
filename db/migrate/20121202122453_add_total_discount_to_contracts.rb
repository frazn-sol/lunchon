class AddTotalDiscountToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :total_discount, :decimal, :precision => 10, :scale => 2, :default => 0.00
  end
end
