class RedemptionSerializer < ApplicationSerializer
  attributes :id, :code, :purchase_price, :contract_conditions
  attribute  :expiration_date
  attribute  :deal_name
  attribute  :restaurant_name

  def expiration_date
    object.expiration_date.to_s(:long)
  end

  def deal_name
    object.deal_name
  end

  def restaurant_name
    object.restaurant_name
  end

end
