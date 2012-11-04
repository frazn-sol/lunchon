class LunchBagController < ApplicationController
  respond_to :json

  def add_item
    session[:lunch_bag] ||= Hash.new(0)
    session[:lunch_bag][params[:deal_id]] += 1
    @lunch_bag = LunchBag.new({items: session[:lunch_bag] || {}})
    render json: @lunch_bag.to_json
  end

  def remove_item
    session[:lunch_bag] ||= Hash.new(0)
    new_quant = session[:lunch_bag][params[:deal_id]] - 1
    session[:lunch_bag][params[:deal_id]] = [new_quant,0].max
    @lunch_bag = LunchBag.new({items: session[:lunch_bag]})
    render json: @lunch_bag.to_json
  end

  def clear
    session[:lunch_bag] = Hash.new(0)
    @lunch_bag = LunchBag.new({items: session[:lunch_bag]})
    render json: @lunch_bag.to_json
  end

  def show
    render json: session[:lunch_bag]
  end

end
