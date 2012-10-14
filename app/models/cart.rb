class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :deals, through: :cart_items

  def total_price
    @total_price ||= cart_items.reduce(0){ |sum,i| sum+= i.price}
  end

  def total_original_price
    @total_original_price ||= cart_items.reduce(0){ |sum, i| sum+= i.original_price || 0}
  end

  def total_savings
    total_original_price - total_price
  end
end
