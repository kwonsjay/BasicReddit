FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      Faker::Name.name
    end
    sequence :password do |n|
      Faker::Lorem.words(1)
    end
    sequence :email do |n|
      Faker::Internet.email
    end
  end
end
