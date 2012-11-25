class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def clear_lunch_bag
    session[:lunch_bag] = Hash.new(0)
  end
end
