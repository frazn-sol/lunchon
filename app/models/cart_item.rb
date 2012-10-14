class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :deal
  attr_accessible :cart_id, :deal_id

  delegate :price, :original_price, to: :deal
end
