class Contract < ActiveRecord::Base
  has_many :deals
  has_many :contract_conditions
  belongs_to :restaurant
  attr_accessible :price, :restaurant_id, :name, :value, :number_of_deals, :contract_conditions_attributes, :total_discount

  accepts_nested_attributes_for :contract_conditions

  before_create :add_default_name

  def deals_sold_count
    PurchaseItem.where(deal_id: deals).size
  end

  def deals_remaining_count
    if number_of_deals.present?
      number_of_deals - deals_sold_count
    else
      0
    end
  end

  private
  def add_default_name
    return unless self.name.blank?
    contracts_for_this_restaurant = self.restaurant.contracts.size
    self.name = "Contract #{contracts_for_this_restaurant + 1}"
  end
end
