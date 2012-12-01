class Restaurant < ActiveRecord::Base
  has_many :contracts
  has_many :deals, through: :contracts

  attr_accessible :name
end
