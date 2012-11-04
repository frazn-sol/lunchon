class LunchBag
  cattr_accessor :discounts
  @@discounts = {
                 0 => BigDecimal.new(0.00,2),
                 1 => BigDecimal.new(0.10,2),
                 2 => BigDecimal.new(0.20,2),
                 3 => BigDecimal.new(0.30,2),
                 4 => BigDecimal.new(0.40,2),
                 5 => BigDecimal.new(0.50,2)
                }
  attr_accessor :item_args, :items, :deal_ids

  def initialize(args)
    @item_args = args.fetch(:items, {}).stringify_keys
    @deal_ids = @item_args.keys
    @items = build_items 
  end

  def to_json
    {total_price: total_price.to_f, discounted_price: discounted_price.to_f, items: items, discount: discount_percentage}
  end

  def discounted_price
    total_price*(1.0-discount_percentage)
  end

  def total_price
    items.map{ |i| item_price(i)}.sum.to_f
  end

  def discount_percentage
    discounts.fetch(total_quantity_of_items, max_discount)
  end

  private

  def discounts
    LunchBag.discounts
  end

  def max_discount
    0.50
  end

  def build_items
    Deal.where(id: @deal_ids).map{ |d| d.to_lunch_bag.merge(quantity: item_args[d.id.to_s])}
  end

  def total_quantity_of_items
    items.map{ |i| i[:quantity]}.sum
  end

  def item_price(item)
    item.fetch(:original_price, 0)*item.fetch(:quantity, 0)
  end
end
