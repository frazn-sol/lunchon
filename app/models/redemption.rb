class Redemption < ActiveRecord::Base
  belongs_to :purchase_item
  attr_accessible :code, :purchase_item_id, :redeemable, :redeemed_at, :redeemed_by, :requested_at
  
  delegate :restaurant, :deal, :purchase_price, :contract_conditions, to: :purchase_item

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

  def redeem_error(user)
    #TODO create an audit trail, either in db or log, for errors
    return "You do not have access to redeem this code" unless user.is_merchant? && user.works_for?(restaurant.id)
    return "That code has been invalidated by the purchaser" if invalidated?
    return "That code was redeemed on #{redeemed_at.to_s(:long)}" if redeemed?
    return "That code has expired" if expired?
    nil
  end

  def valid_restaurant?(user)
    merchant = Merchant.find_by_id(user.id)
    return false unless merchant
    merchant.restaurant_ids.include?(restaurant.id)
  end

  def invalidated?
    redeemable == false && redeemed_at.nil? && redeemed_by.nil?
  end

  def redeemed?
    redeemable == false && redeemed_at.present? && redeemed_by.present?
  end

  def expired?
    Time.now > expiration_date
  end

  def redeem(user)
    return unless user.is_merchant?
    update_column :redeemed_at, Time.now
    update_column :redeemed_by, user.id
    update_column :redeemable, false
  end

  private
  def encoded_restaurant
    Encoder::Restaurant.new.encode(restaurant.id)
  end

  def encoded_purchase_item
    Encoder::PurchaseItem.new(time_seed: requested_at).encode(purchase_item_id)
  end

end
