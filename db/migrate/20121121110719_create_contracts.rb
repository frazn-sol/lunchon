class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :restaurant_id
      t.decimal :price, :precision => 10, :scale => 2, :default => 0.00
      t.decimal :value, :precision => 10, :scale => 2, :default => 0.00

      t.timestamps
    end
  end
end
