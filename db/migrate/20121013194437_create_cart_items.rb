class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :deal_id
      t.integer :cart_id
    end
  end
end
