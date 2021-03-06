class PurchaseSerializer < ApplicationSerializer
  attributes :price
  attributes  :created_at
  has_many :purchase_items

  def created_at
    object.created_at.strftime("%b %e, %Y %l:%M%p")
  end

end
