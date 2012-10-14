class DealSerializer < ApplicationSerializer
  attributes :id, :description, :image, :name, :price, :original_price
  has_one :restaurant
  attribute :rating
  attribute :rating_class

  def rating
    object.avg_rating
  end

  def rating_class
    "stars_#{rating.to_s.sub('.','')}"
  end
end
