class CustomCode < ActiveRecord::Base
  belongs_to :deal
  attr_accessible :code, :consumed, :deal_id
end
