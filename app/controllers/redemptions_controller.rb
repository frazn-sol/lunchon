class RedemptionsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def create
    @purchase_item = current_user.purchase_items.find_by_id(params[:purchase_item_id])
    @purchase_item.invalidate_redemptions
    @redemption = Redemption.new purchase_item_id: @purchase_item.id, redeemable: true, requested_at: Time.now
    @redemption.generate_code
    @redemption.save
    respond_with @redemption
  end
end
