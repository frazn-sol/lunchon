class PurchasesController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    @purchases = current_user.purchases.includes(purchase_items: [deal: [:restaurant]]).order('created_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  def create
    @purchase = Purchase.new user_id: current_user.id, cc_token: params[:cc_token]
    lunch_bag = LunchBag.new({items: session[:lunch_bag] || {}})
    lunch_bag.items.each do |item|
      @deal = Deal.find(item[:deal_id])
      @remaining = @deal.remaining
      if item[:quantity] > @remaining
        item[:quantity] = @remaining
      end
    end
    @purchase.price = lunch_bag.discounted_price
    @purchase.discount_percentage = lunch_bag.discount_percentage
    @purchase.build_purchase_items(lunch_bag.items)

    if @purchase.save_with_payment
      UserMailer.purchase_email(current_user, @purchase).deliver
      clear_lunch_bag
      render json: current_user.purchases.to_json
    else
      # @purchase.save_with_payment raises exceptions
      # so error handling is done in the rescue body
    end
  rescue Stripe::CardError => e
    log_error(e)
    body = e.json_body
    err  = body[:error]
    render json: {error: {message: err[:message]}}.to_json, status: e.http_status
  rescue Stripe::InvalidRequestError => e
    handle_error(e)
  rescue Stripe::AuthenticationError => e
    handle_error(e)
  rescue Stripe::APIConnectionError => e
    handle_error(e)
  rescue Stripe::StripeError => e
    handle_error(e)
  rescue => e
    handle_error(e)
  end

  private

  def handle_error(e)
    log_error(e)
   render json: {error: {message: 'There has been a error processing your request.  Please contact Lunchon.co'}}.to_json, status: e.http_status
  end

  def log_error(e)
   Rails.logger.info "Stripe Error: current_user: #{@current_user.id}  message: #{e.json_body}  @ #{Time.now}"
  end

end
