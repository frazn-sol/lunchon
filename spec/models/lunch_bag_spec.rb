require 'spec_helper'

describe LunchBag do
  it 'creates a lunchbag' do
    lunch_bag = LunchBag.new({})
    lunch_bag.should be_a LunchBag
  end

  it 'finds the deal_ids it needs from the arg keys' do
    args = {items: {"4" => 1, "5" => 2}}
    lunch_bag = LunchBag.new(args)
    lunch_bag.deal_ids.should include "4", "5"
  end

  it 'converts the deal_ids to strings' do
    args = {items: {4 => 1, 5 => 2}}
    lunch_bag = LunchBag.new(args)
    lunch_bag.deal_ids.should include "4", "5"
  end

  it 'builds the lunch_items' do
    deal1 = FactoryGirl.create(:deal)
    deal2 = FactoryGirl.create(:deal)
    quant1 = 1
    quant2 = 2
    args = {items: {deal1.id => quant1, deal2.id => quant2}}
    lunch_bag = LunchBag.new(args)
    lunch_bag.items.should include( {deal_id: deal1.id, name: deal1.name, original_price: deal1.original_price, quantity: quant1})
    lunch_bag.items.should include( {deal_id: deal2.id, name: deal2.name, original_price: deal2.original_price, quantity: quant2})
  end

  it 'has a json representation' do
    deal1 = FactoryGirl.create(:deal, original_price: 10)
    deal2 = FactoryGirl.create(:deal, original_price: 10)
    quant1 = 1
    quant2 = 2
    args = {items: {deal1.id => quant1, deal2.id => quant2}}
    lunch_bag = LunchBag.new(args)
    json = lunch_bag.to_json
    json.should have_key :total_price
    json.should have_key :items
    json[:total_price].should == 30
    json[:discounted_price].should == (30*(1.0-0.30))
    json[:items].size.should == 2
    json[:items].should include( {deal_id: deal1.id, name: deal1.name, original_price: deal1.original_price, quantity: quant1})
    json[:items].should include( {deal_id: deal2.id, name: deal2.name, original_price: deal2.original_price, quantity: quant2})
  end

  context 'calculating the price' do
    it 'knows the discount percentage to apply' do
      deal1 = FactoryGirl.create(:deal)
      deal2 = FactoryGirl.create(:deal)

      args = {items: {deal1.id => 1}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discount_percentage.should == 0.10

      args = {items: {deal1.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discount_percentage.should == 0.20

      args = {items: {deal1.id => 2, deal2.id => 1}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discount_percentage.should == 0.30

      args = {items: {deal1.id => 2, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discount_percentage.should == 0.40

      args = {items: {deal1.id => 3, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discount_percentage.should == 0.50

      args = {items: {deal1.id => 4, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discount_percentage.should == 0.50

      args = {items: {deal1.id => 4, deal2.id => 3}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discount_percentage.should == 0.50
    end

    it 'calculates the total price' do
      price1 = 8.00
      price2 = 10.00
      deal1 = FactoryGirl.create(:deal, original_price: price1)
      deal2 = FactoryGirl.create(:deal, original_price: price2)

      args = {items: {deal1.id => 1}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.total_price.should == price1

      args = {items: {deal1.id => 1, deal2.id => 1}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.total_price.should == (price1 + price2)

      args = {items: {deal1.id => 1, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.total_price.should == (price1 + price2*2)

      args = {items: {deal1.id => 2, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.total_price.should == (price1*2 + price2*2)

      args = {items: {deal1.id => 3, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.total_price.should == (price1*3 + price2*2)

      args = {items: {deal1.id => 3, deal2.id => 3}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.total_price.should == (price1*3 + price2*3)
    end

    it 'calculate the discounted price' do
      price1 = 8.00
      price2 = 10.00
      deal1 = FactoryGirl.create(:deal, original_price: price1)
      deal2 = FactoryGirl.create(:deal, original_price: price2)

      args = {items: {deal1.id => 1}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discounted_price.should == price1*(1.0-0.1)

      args = {items: {deal1.id => 1, deal2.id => 1}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discounted_price.should == (price1 + price2)*(1.0-0.20)

      args = {items: {deal1.id => 1, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discounted_price.should == (price1 + price2*2)*(1.0-0.3)

      args = {items: {deal1.id => 2, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discounted_price.should == (price1*2 + price2*2)*(1.0-0.4)

      args = {items: {deal1.id => 3, deal2.id => 2}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discounted_price.should == (price1*3 + price2*2)*(1.0-0.5)

      args = {items: {deal1.id => 3, deal2.id => 3}}
      lunch_bag = LunchBag.new(args)
      lunch_bag.discounted_price.should == (price1*3 + price2*3)*(1.0-0.5)

    end
  end # context 'calculating the price'
end
