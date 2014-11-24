class RedemptionSerializer < ApplicationSerializer
  attributes :id, :code, :purchase_price, :contract_conditions
  attributes  :expiration_date
  attributes  :deal_name
  attributes  :restaurant_name
  attributes :redeemable
  attributes  :redeemed_at

  def expiration_date
    object.expiration_date.to_s(:long)
  end

  def redeemed_at
    object.redeemed_at.to_s(:long) if object.redeemed_at
  end

  def deal_name
    object.deal_name
  end

  def restaurant_name
    object.restaurant_name
  end

end
