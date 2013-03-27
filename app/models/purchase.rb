class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many   :purchase_items, dependent: :destroy
  attr_accessor :cc_token
  attr_accessible :cc_transaction_id, :price, :user_id, :cc_token

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create(amount: (price*100).to_i, currency: 'usd',
                                      card: cc_token)
      self.cc_transaction_id = charge.id
      save!
    end
  end

  def build_purchase_items(lunch_bag_items)
    lunch_bag_items.each do |item|
      item[:quantity].times do
        purchase_items.build deal_id: item[:deal_id]
      end
    end

  end
end
