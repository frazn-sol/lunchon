require 'spec_helper'

describe LunchBagController do
  context 'adding items' do
    it 'creates the session hash if needed' do
      session.delete(:lunch_bag)
      session.has_key?(:lunch_bag).should be_false
      post :add_item, deal_id: 5
      session.has_key?(:lunch_bag).should be_true
      session[:lunch_bag].should == {"5" => 1}
    end

    it 'adds an item to the session' do
      post :add_item, deal_id: 5
      session[:lunch_bag].should == {"5" => 1}
    end

    it 'increments the value if the key exists' do
      post :add_item, deal_id: 5
      session[:lunch_bag].should == {"5" => 1}
      post :add_item, deal_id: 5
      session[:lunch_bag].should == {"5" => 2}
    end

    it 'handles multiple deals' do
      post :add_item, deal_id: 5
      post :add_item, deal_id: 6
      session[:lunch_bag].should == {"5" => 1, "6" => 1}
    end

    it 'builds a lunch_bag from the session' do
      LunchBag.should_receive(:new).with({items: {"6" => 1}})
      post :add_item, deal_id: 6
    end
  end # context 'adding items'

  context 'removing items' do
    it 'removes an item' do
      post :add_item, deal_id: 5
      post :add_item, deal_id: 5
      session[:lunch_bag].should == {"5" => 2}
      post :remove_item, deal_id: 5
      session[:lunch_bag].should == {"5" => 1}
    end

    it 'deletes the key if the count is 0' do
      post :add_item, deal_id: 5
      post :remove_item, deal_id: 5
      session[:lunch_bag].has_key?("5").should be_false
    end

    it 'does not change other keys' do
      post :add_item, deal_id: 5
      post :add_item, deal_id: 6
      post :remove_item, deal_id: 5
      session[:lunch_bag].has_key?("5").should be_false
      session[:lunch_bag].should == {"6" => 1}
    end

    it 'does not allow negative numbers' do
      post :add_item, deal_id: 6
      session[:lunch_bag].has_key?("5").should be_false
      post :remove_item, deal_id: 5
      session[:lunch_bag].has_key?("5").should be_false
    end

    it 'builds a lunch_bag from the session' do
      LunchBag.should_receive(:new).with({items: {}})
      post :remove_item, deal_id: 5
    end
  end # context 'removing items'

  context 'clearing the lunch_bag' do
    it 'clears the hash' do
      post :add_item, deal_id: 6
      session[:lunch_bag].should == {"6" => 1}
      post :clear
      session[:lunch_bag].should == {}
    end

    it 'builds a lunch_bag from the session' do
      LunchBag.should_receive(:new).with({items: {}})
      post :clear
    end
  end # context 'clearing the lunch_bag'

  context 'setting the quantity' do
    it 'sets the quantity to the param sent' do
      post :set_quantity, deal_id: 6, quantity: 3
      session[:lunch_bag].should == {"6" => 3}
    end

    it 'builds a lunch_bag from the session' do
      LunchBag.should_receive(:new).with({items: {"6" => 3}})
      post :set_quantity, deal_id: 6, quantity: 3
    end

    it 'works with strings' do
      post :set_quantity, deal_id: 6, quantity: '3'
      session[:lunch_bag].should == {"6" => 3}
    end

    it 'changes the quantity if it exists' do
      post :add_item, deal_id: 6
      session[:lunch_bag].should == {"6" => 1}
      post :set_quantity, deal_id: 6, quantity: 3
      session[:lunch_bag].should == {"6" => 3}
    end

    it 'reduces the quantity too' do
      post :add_item, deal_id: 6
      post :add_item, deal_id: 6
      session[:lunch_bag].should == {"6" => 2}
      post :set_quantity, deal_id: 6, quantity: 1
      session[:lunch_bag].should == {"6" => 1}
    end

    it 'removes the key is the quantity is 0' do
      post :add_item, deal_id: 6
      session[:lunch_bag].should == {"6" => 1}
      post :set_quantity, deal_id: 6, quantity: 0
      session[:lunch_bag].has_key?("6").should be_false
    end

    it 'does not allow negative numbers' do
      post :set_quantity, deal_id: 6, quantity: -1
      session[:lunch_bag].has_key?("6").should be_false
    end

    it 'does not allow non-numeric inputs' do
      post :set_quantity, deal_id: 6, quantity: 'abc'
      session[:lunch_bag].has_key?("6").should be_false
    end

  end # context 'setting the quantity'

end
