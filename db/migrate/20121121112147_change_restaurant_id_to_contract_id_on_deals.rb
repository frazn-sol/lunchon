class ChangeRestaurantIdToContractIdOnDeals < ActiveRecord::Migration
  def change
    rename_column :deals, :restaurant_id, :contract_id
  end

end
