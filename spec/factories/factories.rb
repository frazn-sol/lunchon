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

  factory :contract do
    restaurant_id 1
  end

  factory :restaurant do
    name
  end

  factory :user do
    email
    password '123456'
    password_confirmation '123456'
  end
end
