class Restaurant < ActiveRecord::Base
  has_many :deals

  attr_accessible :name
end
