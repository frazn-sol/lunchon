class Location < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :city, :hours, :latitude, :longitude, :restaurant_id, :state, :street_1, :street_2, :zip, :phone

  geocoded_by :full_street_address

  after_validation :geocode

  def full_street_address
    [street_1, city, state, zip].compact.join(', ')
  end
end
