FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "#{ Faker::Commerce.product_name } #{ n }" }
    description { Faker::Lorem.paragraph }

    factory :product_invalid do
      name nil
    end
  end
end
