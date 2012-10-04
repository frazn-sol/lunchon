class ChangeDealAddRestaurantId < ActiveRecord::Migration
  def change
    add_column :deals, :restaurant_id, :integer
    add_index :deals, :restaurant_id
  end

end
