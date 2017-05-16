FactoryGirl.define do
  factory :timetable do
    place_depart Faker::Address.city
    time_depart Faker::Time.between(DateTime.now + 2, DateTime.now)
    place_arrive Faker::Address.city
    time_arrive Faker::Time.between(DateTime.now + 3, DateTime.now + 2)
    amount_of_place Faker::Number.between(1, 10)
    price Faker::Number.decimal(2, 3)
  end
end