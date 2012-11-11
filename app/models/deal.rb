class Deal < ActiveRecord::Base
  has_many :comments
  has_many :ratings
  belongs_to :restaurant

  attr_accessible :name, :price, :image, :rating, :restaurant_id, :description, :original_price
  attr_accessor :featured

  validates_numericality_of :price, :original_price
  validates_presence_of :name, :price, :original_price

  mount_uploader :image, ImageUploader

  def avg_rating(round=true)
    ratings_ary = ratings.pluck(:rating)
    divisor = [ratings_ary.size, 1].max.to_f
    avg = ratings_ary.reduce(0){ |sum, r|  sum +=r}/divisor
    round ? round_to_half(avg) : avg
  end

  def to_lunch_bag
    {deal_id: id, name: name, original_price: original_price.to_f}
  end


  private 
  def round_to_half(num)
    (num*2.0).round/2.0
  end
end
