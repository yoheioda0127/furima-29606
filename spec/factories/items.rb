FactoryBot.define do
  factory :item do
    item_name     {Faker::Commerce.product_name}
    detail        {Faker::Lorem.sentence}
    category_id   {Faker::Number.between(from: 2, to: 11)}
    condition_id  {Faker::Number.between(from: 2, to: 7)}
    ship_cost_id  {Faker::Number.between(from: 2, to: 3)}
    ship_pref_id  {Faker::Number.between(from: 2, to: 48)}
    ship_day_id   {Faker::Number.between(from: 2, to: 4)}
    price         {Faker::Number.within(range: 300..9999999)}
    association    :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

  end
end