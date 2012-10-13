class RemoveRatingsFromDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :rating
  end
end
