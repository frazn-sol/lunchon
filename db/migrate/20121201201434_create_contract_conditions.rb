class CreateContractConditions < ActiveRecord::Migration
  def change
    create_table :contract_conditions do |t|
      t.integer :contract_id
      t.string :verbage
    end
  end
end
