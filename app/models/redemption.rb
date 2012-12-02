class Redemption < ActiveRecord::Base
  belongs_to :purchase_item
  attr_accessible :code, :purchase_item_id, :redeemable, :redeemed_at, :redeemed_by, :requested_at

  delegate :restaurant, to: :purchase_item

  def code
    "#{encoded_restaurant}-#{encoded_purchase_item}"
  end

  def valid_for_restaurant?(restaurant_id)
    restaurant_id.to_i == restaurant.id
  end

  private
  def encoded_restaurant
    Encoder::Restaurant.new.encode(restaurant.id)
  end

  def encoded_purchase_item
    Encoder::PurchaseItem.new.encode(purchase_item_id)
  end
end
