class Restaurant < ActiveRecord::Base
  has_many :contracts
  has_many :deals, through: :contracts
  has_many :locations
  has_and_belongs_to_many :merchants

  accepts_nested_attributes_for :locations, allow_destroy: true

  attr_accessible :name, :locations_attributes
end
