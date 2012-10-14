class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_cart
    @current_cart = Cart.find_or_create_by_id(id: session[:cart_id])
    session[:cart_id] = @current_cart.id
    @current_cart
  end
end
