class Restaurant < ActiveRecord::Base
  has_many :contracts
  has_many :deals, through: :contracts
  has_many :locations

  accepts_nested_attributes_for :locations, allow_destroy: true

  attr_accessible :name, :locations_attributes
end
