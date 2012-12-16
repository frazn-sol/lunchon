class LocationSerializer < ApplicationSerializer
  attributes :id, :restaurant_id, :latitude, :longitude
  attributes :street_1, :street_2, :city, :state, :zip
  attributes :hours, :phone
end
