class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :restaurant_id
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.string :hours

      t.timestamps
    end
    add_index :locations, :restaurant_id
  end
end
