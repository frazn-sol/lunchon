class Deal < ActiveRecord::Base
  has_many :comments
  has_many :ratings
  has_many :purchase_items
  has_many :custom_codes
  belongs_to :contract
  has_one :restaurant, through: :contract

  attr_accessible :name, :image, :description, :original_price, :quantity_purchased, :contract_id
  attr_accessor :featured, :remaining

  validates_numericality_of :original_price, :quantity_purchased
  validates_presence_of :name, :original_price, :quantity_purchased

  mount_uploader :image, ImageUploader

  def avg_rating(round=true)
    ratings_ary = ratings.map(&:rating)
    divisor = [ratings_ary.size, 1].max.to_f
    avg = ratings_ary.reduce(0){ |sum, r|  sum +=r}/divisor
    round ? round_to_half(avg) : avg
  end

  def restaurant_name
    restaurant.name
  end

  def contract_conditions
    contract.contract_conditions
  end

  def to_lunch_bag
    {deal_id: id, name: name, original_price: original_price.to_f}
  end

  def remaining
    quantity_purchased - purchase_items.size
  end


  private 
  def round_to_half(num)
    (num*2.0).round/2.0
  end
end
