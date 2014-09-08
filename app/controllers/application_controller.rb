class ApplicationController < ActionController::Base
  before_filter :set_time_zone, :instantiateUser, :checkcount
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

  def after_sign_up_path_for(resource)
    if !resource.is_merchant?
      how_it_works_path
    end
  end

  def instantiateUser
    @user = User.new  
  end

  def checkcount
    if current_user.present?
      return true
    elsif cookies[:count]==nil
      cookies[:count] = 1 
      redirect_to new_user_registration_path
    elsif cookies[:count].present? && cookies[:count] ==1
      cookies[:count] = 2
      redirect_to root_url and return     
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
