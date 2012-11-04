require 'spec_helper'

describe DealsController do
  it 'is plumbed correctly' do
    true
  end
  it 'builds a lunch_bag in the index action' do
    #deal1 = FactoryGirl.create(:deal, original_price: 10)
    #deal2 = FactoryGirl.create(:deal, original_price: 10)
    get :index
    assigns[:lunch_bag].should be_a LunchBag
  end

  it 'reads the session to get the lunch_bag items' do
    deal1 = FactoryGirl.create(:deal, original_price: 10)
    deal2 = FactoryGirl.create(:deal, original_price: 10)
    session[:lunch_bag] = {deal1.id => 1, deal2.id => 1}
    get :index
    lunch_bag = assigns[:lunch_bag]
    lunch_bag.items.size.should == 2
    lunch_bag.deal_ids.should include deal1.id.to_s, deal2.id.to_s
    lunch_bag.total_price.should == 20
    lunch_bag.discounted_price.should == 16
  end
end
