FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence(:email) { |n| "andrii#{n}@dovhan.com"}
    admin '1'
    password Faker::Internet.password
  end
end