module DealsHelper
  def deals_rating_class(deal)
    rating_string = number_with_precision(deal.avg_rating, precision: 1).sub('.','')
    "rating stars_#{rating_string}"
  end
end
