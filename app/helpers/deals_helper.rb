module DealsHelper
  def deals_rating_class(deal)
    "rating stars_#{deal.rating.to_s.sub('.','')}"
  end
end
