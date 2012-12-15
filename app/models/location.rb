class Location < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :city, :hours, :latitude, :longitude, :restaurant_id, :state, :street_1, :street_2, :zip
end
