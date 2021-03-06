class DealsController < ApplicationController
  respond_to :json

  def index
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

  def show
    @deal = Deal.find(params[:id])
    comment_id = @deal.comments.pluck(:id).shuffle.first
    @comment = @deal.comments.find_by_id(comment_id)

    respond_to do |format|
      format.html { render 'show', layout: nil}
      format.json { render json: @deal }
    end
  end

  def new
    @deal = Deal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def create
    @deal = Deal.new(params[:deal])

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end
end
