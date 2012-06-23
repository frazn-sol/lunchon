class Comment < ActiveRecord::Base
  belongs_to :deal
  attr_accessible :contributor, :deal_id, :message
end
