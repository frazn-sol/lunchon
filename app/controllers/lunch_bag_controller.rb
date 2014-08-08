class LunchBagController < ApplicationController
  before_filter :create_session_lunch_bag, except: [:clear]
  respond_to :json

  def add_item
    session[:lunch_bag][params[:deal_id]] += 1
    render json: lunch_bag.to_json
  end

  def get_items
    session[:lunch_bag][params[:deal_id]]
    render json: lunch_bag.to_json
  end

  def set_quantity
    set_session_quantity params.fetch(:quantity, 1)
    render json: lunch_bag.to_json
  end

  def remove_item
    set_session_quantity (session[:lunch_bag][params[:deal_id]] - 1)
    render json: lunch_bag.to_json
  end

  def clear
    clear_lunch_bag
    render json: lunch_bag.to_json
  end

  private
  def lunch_bag
    LunchBag.new({items: session[:lunch_bag]})
  end

  def create_session_lunch_bag
    session[:lunch_bag] ||= Hash.new(0)
  end

  def set_session_quantity(quantity)
    quantity = [quantity.to_i, 0].max
    if quantity == 0
      session[:lunch_bag].delete(params[:deal_id])
    else
      session[:lunch_bag][params[:deal_id]] = quantity
    end
  end
end
