class ChangeDealAddDescription < ActiveRecord::Migration
  def change
    add_column :deals, :description, :text
  end

end
