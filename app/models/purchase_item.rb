class PurchaseItem < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :deal
  attr_accessible :deal_id, :purchase_id

  after_save :set_redemption_code

  delegate :restaurant_name, to: :deal
  
  scope :for_deal, lambda{ |deal_id| where(deal_id: deal_id) } 

  def deal_name
    deal.name
  end

  private
  def set_redemption_code
    codes = PurchaseItem.scoped.pluck(:redemption_code)
    loop do
      code = Devise.friendly_token
      unless codes.include?(code)
        update_column :redemption_code, code
        break
      end
    end
  end
end
