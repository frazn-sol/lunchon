class PurchaseItem < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :deal
  has_many :redemptions
  attr_accessible :deal_id, :purchase_id

  delegate :contract, :restaurant, :restaurant_name, to: :deal
  
  scope :for_deal, lambda{ |deal_id| where(deal_id: deal_id) } 

  def deal_name
    deal.name
  end

  def contract_conditions
    deal.contract_conditions
  end

  def purchase_price
    deal.original_price * (1- purchase.discount_percentage)
  end

  def discount_percentage
    purchase.discount_percentage
  end

  def invalidate_redemptions
    redemptions.each{ |r| r.update_column :redeemable, false}
  end

end
