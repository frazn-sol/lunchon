class Contract < ActiveRecord::Base
  has_many :deals
  belongs_to :restaurant
  attr_accessible :price, :restaurant_id, :value, :number_of_deals

  def name
    "Contract #{id}"
  end
end
