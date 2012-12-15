class ApplicationController < ActionController::Base
  before_filter :set_time_zone
  protect_from_forgery

  private


  def set_time_zone
    Time.zone = "Eastern Time (US & Canada)"
  end

  def clear_lunch_bag
    session[:lunch_bag] = Hash.new(0)
  end
end
