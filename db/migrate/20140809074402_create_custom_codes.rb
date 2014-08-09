class CreateCustomCodes < ActiveRecord::Migration
  def change
    create_table :custom_codes do |t|
      t.string :code
      t.boolean :consumed, :default => false
      t.belongs_to :deal


      t.timestamps
    end
  end
end
