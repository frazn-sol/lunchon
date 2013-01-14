class ApplicationController < ActionController::Base
  before_filter :set_time_zone
  helper_method :current_merchant
  protect_from_forgery

  private

  def after_sign_in_path_for(resource)
    if resource.is_merchant?
      redeem_path
    else
      root_path
    end
  end

  def set_time_zone
    Time.zone = "Eastern Time (US & Canada)"
  end

  def clear_lunch_bag
    session[:lunch_bag] = Hash.new(0)
  end

  def current_merchant
    Merchant.where(id: current_user.id).first
  end
end
