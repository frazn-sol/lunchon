class CartItemsController < ApplicationController
respond_to :html, :json

  def create
    @cart = current_cart
    deal = Deal.find(params[:deal_id])
    @cart.cart_items.build(deal_id: deal.id)
    if @cart.save
      respond_with @cart
    end
    #respond_to do |format|

      #if @cart.save
        #format.html { redirect_to @cart }
        #format.json { respond_with @cart }
      #end
    #end

  end
end
