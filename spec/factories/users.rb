FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.unique.name}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_name_kana       {Faker::Japanese::Name.first_name.yomi}
    last_name_kana        {Faker::Japanese::Name.last_name.yomi}
    email                 {Faker::Internet.free_email}
    birthday              {Faker::Date.birthday}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end