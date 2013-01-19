class Restaurant < ActiveRecord::Base
  has_many :contracts
  has_many :deals, through: :contracts
  has_many :purchase_items, through: :deals
  has_many :locations
  has_and_belongs_to_many :merchants

  accepts_nested_attributes_for :locations, allow_destroy: true

  attr_accessible :name, :locations_attributes


  def redemptions
    Redemption.where(purchase_item_id: purchase_items.map(&:id))
  end

  def redeemed_redemptions
    redemptions.redeemed
  end
end
