FactoryGirl.define do
  sequence :name do |n|
    "some_name_#{n}"
  end

  sequence :email do |n|
    "some_email_#{n}@example.com"
  end

  factory :deal do
    name
    original_price 10
    contract_id 1
  end

  factory :restaurant do
    name
  end

  factory :contract do
    restaurant_id 6
    number_of_deals 10
    total_discount  0.55
  end

  factory :purchase do
    user_id 5
    price   10.50
    discount_percentage 0.30
  end

  factory :purchase_item do
    purchase_id 5
    deal_id     5
  end
  
  factory :user do
    email
    password '123456'
    password_confirmation '123456'
  end

  factory :redemption do
    purchase_item_id 5
  end
end
