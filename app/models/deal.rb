class Deal < ActiveRecord::Base
  has_many :comments
  has_many :ratings
  belongs_to :restaurant

  attr_accessible :name, :price, :image, :rating, :restaurant_id, :description, :original_price

  validates_numericality_of :price, :original_price
  validates_presence_of :name, :price, :original_price

  mount_uploader :image, ImageUploader

  def avg_rating
    (ratings.average(:rating).to_f*2.0).round / 2.0
  end
end
