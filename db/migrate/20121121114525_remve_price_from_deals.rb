class RemvePriceFromDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :price
  end
end
