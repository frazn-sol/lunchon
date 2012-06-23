class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :deal_id
      t.text :message
      t.string :contributor

      t.timestamps
    end
  end
end
