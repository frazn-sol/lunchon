require 'spec_helper'

describe RedemptionsController do
  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    @current_merchant = FactoryGirl.create(:merchant, restaurant_ids: [@restaurant.id])
    sign_in :user, @current_merchant
    @purchaser  = FactoryGirl.create(:user)
  end

  it 'validates a code' do
    contract = FactoryGirl.create(:contract, restaurant_id: @restaurant.id)
    deal = FactoryGirl.create(:deal, contract_id: contract.id)
    purchase = FactoryGirl.create(:purchase, user_id: @purchaser.id)
    purchase_item = FactoryGirl.create(:purchase_item, purchase_id: purchase.id, deal_id: deal.id)
    redemption = FactoryGirl.create(:redemption, purchase_item_id: purchase_item.id, requested_at: Time.now)
    code = redemption.generate_code
    purchase_item.redeemed_at.should be_nil
    redemption.save
    post :validate, redemption: {code: code+ '1'}
    redemption.reload
    redemption.redeemed_at.should_not be_nil
    redemption.redeemed_by.should == @current_merchant.id
    purchase_item.reload.redeemed_at.should_not be_nil
  end
  


end
