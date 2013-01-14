class CreateMechants < ActiveRecord::Migration
  def change
    add_column :users, :is_merchant, :boolean, default: false, after: :email
  end
end
