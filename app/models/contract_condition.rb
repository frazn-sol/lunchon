class ContractCondition < ActiveRecord::Base
  belongs_to :contract
  attr_accessible :contract_id, :verbage
end
