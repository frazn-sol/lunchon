class Deal < ActiveRecord::Base
  has_many :comments
  attr_accessible :name, :price
  validates_numericality_of :price
  validates_presence_of :name, :price
end
