require 'spec_helper'

describe PurchasesController do
  context 'creating a purchase' do
    login_user
    before(:each) do
      @deal = FactoryGirl.create(:deal, original_price: 10)
    end
    it 'works' do
      subject.current_user.should_not be_nil
    end

    it 'creates purchase items' do
      session[:lunch_bag] = {@deal.id.to_s => 1}
      post :create
      purchase = assigns[:purchase]
      purchase.should_not be_nil
      purchase_items = purchase.purchase_items
      purchase_items.size.should == 1
      purchase_items.first.deal_id.should == @deal.id
    end

    it 'creates the correct number of purchase items' do
      session[:lunch_bag] = {@deal.id.to_s => 2}
      post :create
      purchase = assigns[:purchase]
      purchase_items = purchase.purchase_items
      purchase_items.size.should == 2
    end

    it 'handles multiple deals in the lunch_bag' do
      deal2 = FactoryGirl.create(:deal, original_price: 10)
      session[:lunch_bag] = {@deal.id.to_s => 2, deal2.id.to_s => 2}
      post :create
      purchase = assigns[:purchase]
      purchase_items = purchase.purchase_items
      purchase_items.size.should == 4
      purchase_items.map(&:deal_id).should include(deal2.id, deal2.id, @deal.id, @deal.id)
    end

    it 'clears the lunch_bag when successful' do
      post :create
      session[:lunch_bag].should == {}
    end

  end

end
