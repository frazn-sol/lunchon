class PurchaseItemSerializer < ApplicationSerializer
  attributes :deal_name
  attributes :restaurant_name
  attributes :redeemed_at
  attributes :deal_id
  attributes :id
  attributes :purchase_price
  has_one :restaurant
  has_many :contract_conditions


  def redeemed_at
    object.redeemed_at.try(:to_s, :long)
  end

  def purchase_price
    object.purchase_price
  end


  def deal_name
    object.deal.name
  end

end
