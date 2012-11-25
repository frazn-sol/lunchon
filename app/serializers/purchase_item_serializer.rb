class PurchaseItemSerializer < ApplicationSerializer
  attribute :deal_name
  attribute :restaurant_name
  attribute :redeemed_at
  attribute :redemption_code


  def redeemed_at
    object.redeemed_at.try(:to_s, :long)
  end


  def deal_name
    object.deal.name
  end

end
