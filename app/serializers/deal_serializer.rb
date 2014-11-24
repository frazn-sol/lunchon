class DealSerializer < ApplicationSerializer
  attributes :id, :description, :name
  has_one :restaurant
  attributes :rating
  attributes :rating_class
  attributes :original_price
  attributes :image
  attributes :featured
  attributes :remaining

  def image
    {
      thumb: {url: object.image.thumb.url},
      featured: {url: object.image.featured.url}
    }
  end

  def original_price
    object.original_price.to_f
  end

  def rating
    object.avg_rating
  end

  def rating_class
    "stars_#{rating.to_s.sub('.','')}"
  end

end
