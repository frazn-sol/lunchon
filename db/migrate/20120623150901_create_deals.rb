class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
