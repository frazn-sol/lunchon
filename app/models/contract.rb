class Contract < ActiveRecord::Base
  has_many :deals
  belongs_to :restaurant
  attr_accessible :price, :restaurant_id, :value, :number_of_deals

  def name
    "Contract #{id}"
  end

  def deals_sold_count
    PurchaseItem.where(deal_id: deals).size
  end

  def deals_remaining_count
    number_of_deals - deals_sold_count
  end
end
