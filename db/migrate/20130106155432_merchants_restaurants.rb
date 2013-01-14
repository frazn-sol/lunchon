class MerchantsRestaurants < ActiveRecord::Migration
  def change
    create_table :merchants_restaurants, id: false do |t|
      t.integer :merchant_id
      t.integer :restaurant_id
    end
    add_index :merchants_restaurants, :merchant_id
    add_index :merchants_restaurants, :restaurant_id
  end

end
