FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "#{ Faker::Commerce.product_name } #{ n }" }
    description { Faker::Lorem.paragraph }
  end
end
