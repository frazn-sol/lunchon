class Deal < ActiveRecord::Base
  has_many :comments
  belongs_to :restaurant

  attr_accessible :name, :price, :image, :rating, :restaurant_id, :description, :original_price

  validates_numericality_of :price, :original_price
  validates_presence_of :name, :price, :original_price

  mount_uploader :image, ImageUploader
end
