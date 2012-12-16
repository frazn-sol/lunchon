class PurchaseItemSerializer < ApplicationSerializer
  attribute :deal_name
  attribute :restaurant_name
  attribute :redeemed_at
  attribute :deal_id
  attribute :id
  attribute :purchase_price
  has_one :restaurant


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
