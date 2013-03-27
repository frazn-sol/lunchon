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
    @purchase.price = lunch_bag.discounted_price
    @purchase.discount_percentage = lunch_bag.discount_percentage
    @purchase.build_purchase_items(lunch_bag.items)

    if @purchase.save_with_payment
      UserMailer.purchase_email current_user, @purchase
      clear_lunch_bag
      render json: current_user.purchases.to_json
    else
      #handle the error
    end

  end

end
