class RedemptionsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!
  layout 'redemptions'

  def create
    @purchase_item = current_user.purchase_items.find_by_id(params[:purchase_item_id])
    @redemption = Redemption.find_or_initialize_by_purchase_item_id @purchase_item.id
    if @redemption.new_record?
      @redemption.requested_at  = Time.now
      @deal_id = PurchaseItem.where(:id => params[:purchase_item_id]).first.deal_id
      @code = CustomCode.where(:deal_id => @deal_id, :consumed => false).first
      if @code.present?
        @redemption.code = @code.code
        @code.update_attributes(:consumed=>true)
      else
        @redemption.generate_code
      end
      @redemption.redeemable = true
    end
    @redemption.save
    respond_with @redemption
  end

  def edit
    @redemption_count = current_merchant.restaurants.first.redeemed_redemptions.size
    @redemption = Redemption.new
  end

  def validate
    code = params[:redemption][:code].gsub(/\s+/, "")
    # @temp = code.size
    # @size = 13 - @temp
    # if @size > 0
    #   code = "0".to_s.rjust(@size, "0") + code.to_s
    # end

    # new_code = code[0...-1].delete(' ')
    @redemption = Redemption.find_by_code(code)
      
    if @redemption
      unless flash[:alert] = @redemption.redeem_error(current_user)
        @redemption.redeem(current_user)
        flash[:notice] = "Redemption Successful"
      end
    else
      flash[:alert] = "#{code} was not found"
    end
    redirect_to redeem_path
  end
end
