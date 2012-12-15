class Redemption < ActiveRecord::Base
  belongs_to :purchase_item
  attr_accessible :code, :purchase_item_id, :redeemable, :redeemed_at, :redeemed_by, :requested_at
  

  delegate :restaurant, :deal, :purchase_price, to: :purchase_item

  def generate_code
    self.code = "#{encoded_restaurant}#{encoded_purchase_item}"
  end

  def valid_for_restaurant?(restaurant_id)
    restaurant_id.to_i == restaurant.id
  end

  def expiration_date
    purchase_item.created_at.to_date + 2.weeks
  end

  def restaurant_name
    restaurant.name
  end

  def deal_name
    deal.name
  end

  private
  def encoded_restaurant
    Encoder::Restaurant.new.encode(restaurant.id)
  end

  def encoded_purchase_item
    Encoder::PurchaseItem.new(time_seed: requested_at).encode(purchase_item_id)
  end

end
