class StaticPagesController < ApplicationController
  layout :resolve_layout	 
  
  def terms
  end

  def privacy
  end

  def how_it_works 
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
      format.json { render( json: @deals)}
    end
  end
 private

  	def resolve_layout
    case action_name
	    when "how_it_works"
	      "sessions"
	    else
	      "static"
	    end
  	end
end
