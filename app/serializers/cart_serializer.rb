class CartSerializer < ActiveModel::Serializer
  attributes :id
  attribute :items
  attribute :prices

  def prices
    { total_price: object.total_price, total_original_price: object.total_original_price, total_savings: object.total_savings }
  end

  def items
    total = 0
    object.cart_items.group_by{ |e| e.deal_id}.map  do |deal_id, items|
      item = items.first
      deal = item.deal
      {item: {deal_name: deal.name, 
              price: deal.price,
              original_price: deal.original_price, 
              quantity: items.size,
              sub_total: deal.price * items.size
              }
      }
    end
  end
end
