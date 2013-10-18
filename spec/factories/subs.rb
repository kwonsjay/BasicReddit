FactoryGirl.define do
  factory :sub do
    sequence :user_id do |n|
      n
    end
    sequence :title do |n|
      Faker::Lorem.words(1)
    end
  end
end
