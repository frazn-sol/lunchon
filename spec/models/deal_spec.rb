require 'spec_helper'

describe Deal do
  it 'builds lunchbag hash' do
    original_price = 10
    name = 'Deal Name'
    deal = FactoryGirl.create(:deal, original_price: original_price,
                             name: name)
    deal.to_lunch_bag.should == {deal_id: deal.id, name: name, original_price: original_price}
  end
end
