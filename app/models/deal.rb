class Deal < ActiveRecord::Base
  has_many :comments
  attr_accessible :name, :price, :image
  validates_numericality_of :price
  validates_presence_of :name, :price

  mount_uploader :image, ImageUploader
end
