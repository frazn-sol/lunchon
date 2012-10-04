class Deal < ActiveRecord::Base
  has_many :comments
  belongs_to :restaurant

  attr_accessible :name, :price, :image, :rating, :restaurant_id, :description

  validates_numericality_of :price
  validates_presence_of :name, :price

  mount_uploader :image, ImageUploader
end
