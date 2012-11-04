FactoryGirl.define do
  sequence :name do |n|
    "some_name_#{n}"
  end

  factory :deal do
    name
    price 5
    original_price 10
    restaurant_id 1
  end
end
