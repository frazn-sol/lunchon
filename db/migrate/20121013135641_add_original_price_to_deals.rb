class AddOriginalPriceToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :original_price, :decimal
  end
end
