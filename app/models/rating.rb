class Rating < ActiveRecord::Base
  belongs_to :deal
  attr_accessible :deal_id, :rating, :user_id

  validates_numericality_of :rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 5
  validates_presence_of :rating, :deal_id
end
