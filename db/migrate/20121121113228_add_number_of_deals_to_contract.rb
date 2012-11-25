class AddNumberOfDealsToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :number_of_deals, :integer
  end
end
