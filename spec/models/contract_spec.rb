require 'spec_helper'

describe Contract do
  it 'adds a default name' do
    restaurant = FactoryGirl.create(:restaurant)
    c = Contract.new(restaurant_id: restaurant.id )
    c.save
    c.name.should == 'Contract 1'
  end

  it 'adds the correct default name' do
    restaurant = FactoryGirl.create(:restaurant)
    c1 = FactoryGirl.create(:contract, restaurant_id: restaurant.id)
    c = Contract.new(restaurant_id: restaurant.id )
    c.save
    c.name.should == 'Contract 2'
  end

  it 'honors a name passed to the constructor' do
    name = 'My Contract'
    restaurant = FactoryGirl.create(:restaurant)
    c = Contract.new(restaurant_id: restaurant.id, name: name )
    c.save
    c.name.should == name
  end

  it 'does not change the name on save' do
    name = 'My Contract'
    restaurant = FactoryGirl.create(:restaurant)
    c = Contract.new(restaurant_id: restaurant.id, name: name )
    c.save
    c.name.should == name
    c2 = Contract.new(restaurant_id: restaurant.id, name: name )
    c.number_of_deals = 15
    c.save
    c.name.should == name
  end
end
