class RestaurantSerializer < ApplicationSerializer
  attributes :id, :name
  has_many   :locations
end
