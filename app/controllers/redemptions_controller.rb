class RedemptionsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!
  layout 'sessions'

  def create
    @purchase_item = current_user.purchase_items.find_by_id(params[:purchase_item_id])
    @redemption = Redemption.first_or_initialize purchase_item_id: @purchase_item.id#, redeemable: true, 
    if @redemption.new_record?
      @redemption.requested_at  = Time.now
      @redemption.generate_code
      @redemption.redeemable = true
    end
    @redemption.save
    respond_with @redemption
  end

  def edit
    @redemption = Redemption.new
  end

  def validate
    code = params[:redemption][:code]
    new_code = code[0...-1].delete(' ')
    @redemption = Redemption.find_by_code(new_code)
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
