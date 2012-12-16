require 'spec_helper'

describe Redemption do

  def build_redemption
    @restaurant = FactoryGirl.create(:restaurant)
    contract = FactoryGirl.create(:contract, restaurant_id: @restaurant.id)
    deal = FactoryGirl.create(:deal, contract_id: contract.id)
    purchase_item = FactoryGirl.create(:purchase_item, deal_id: deal.id)
    redemption = FactoryGirl.create(:redemption, purchase_item_id: purchase_item.id, requested_at: Time.now)
  end
  context 'the code' do
    let(:redemption) {build_redemption}

    it 'has a code method that returns a string' do
      redemption.generate_code
      redemption.code.should be_a String
    end

    it 'matches a specific format' do
      redemption.generate_code
      redemption.code.should match /\d{12}/
      #redemption code has format of 
      # XXXX-ZZZZZZZ
      # where XXXX represents the restaurant
      # and ZZZZZZZ represents the purchase item
    end

    it 'knows which restaurant it is for' do
      redemption.valid_for_restaurant?(@restaurant.id).should be_true
    end
  end
end
