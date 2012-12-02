class PurchaseItem < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :deal
  has_many :redemptions
  attr_accessible :deal_id, :purchase_id

  delegate :restaurant, :restaurant_name, to: :deal
  
  scope :for_deal, lambda{ |deal_id| where(deal_id: deal_id) } 

  def deal_name
    deal.name
  end

end
