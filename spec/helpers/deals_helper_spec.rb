require 'spec_helper'

describe DealsHelper do
  it 'should pass a simple test' do
    true
  end

  it 'returns the correct rating class' do
    deal = mock('deal', avg_rating: 5)
    helper.deals_rating_class(deal).should == "rating stars_50"
    deal = mock('deal', avg_rating: 0)
    helper.deals_rating_class(deal).should == "rating stars_00"
    deal = mock('deal', avg_rating: 1.5)
    helper.deals_rating_class(deal).should == "rating stars_15"
  end
end
