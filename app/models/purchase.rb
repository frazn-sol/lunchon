class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many   :purchase_items
  attr_accessible :cc_transaction_id, :price, :user_id

  def build_purchase_items(lunch_bag_items)
    lunch_bag_items.each do |item|
      item[:quantity].times do
        purchase_items.build deal_id: item[:deal_id]
      end
    end

  end
end
