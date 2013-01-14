class Merchant < User
  has_and_belongs_to_many :restaurants
  attr_accessible :email, :password, :password_confirmation, :restaurant_ids

  before_create :set_confirmation
  before_save :set_is_merchant

  def works_for?(restaurant_id)
    restaurant_ids.include?(restaurant_id)
  end

  private
  def set_is_merchant
    self.is_merchant = true
  end

  def set_confirmation
    self.skip_confirmation!
  end

end
