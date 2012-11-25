class PurchaseSerializer < ApplicationSerializer
  attributes :price
  attribute  :created_at
  has_many :purchase_items

  def created_at
    object.created_at.to_s(:long)
  end

end
