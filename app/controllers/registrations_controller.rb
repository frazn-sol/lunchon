class RegistrationsController < Devise::RegistrationsController
  def new
  	redirect_to redeem_path and return if current_user && current_user.is_merchant?
    @deals = Deal.includes(:restaurant, :ratings, :purchase_items).all.shuffle

    #TODO decide how to handle featured deals
    featured_deals = @deals[-2..-1] || []
    featured_deals.map{ |d| d.featured=true}
    @deals_json = @deals.map{ |d| DealSerializer.new(d).as_json}.to_json
    @locations_json = Location.all.map{ |l| LocationSerializer.new(l).as_json }.to_json
    @lunch_bag = LunchBag.new({items: session[:lunch_bag] || {}})
    @is_user_signed_in = user_signed_in?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render( json: @deals)} and return
    end
    super
  end

  def create
    # add custom create logic here
    redirect_to redeem_path and return if current_user && current_user.is_merchant?
    @deals = Deal.includes(:restaurant, :ratings, :purchase_items).all.shuffle

    #TODO decide how to handle featured deals
    featured_deals = @deals[-2..-1] || []
    featured_deals.map{ |d| d.featured=true}
    @deals_json = @deals.map{ |d| DealSerializer.new(d).as_json}.to_json
    @locations_json = Location.all.map{ |l| LocationSerializer.new(l).as_json }.to_json
    @lunch_bag = LunchBag.new({items: session[:lunch_bag] || {}})
    @is_user_signed_in = user_signed_in?

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render( json: @deals)} and return
    # end
    super
  end

  def update
    super
  end
end 