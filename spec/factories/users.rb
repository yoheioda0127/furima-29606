FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {Faker::Name.initials(number: 10)}
    last_name             {Faker::Name.initials(number: 10)}
    first_name_kana        {Faker::Name.initials(number: 10)}
    last_name_kana         {Faker::Name.initials(number: 10)}
    email                 {Faker::Internet.free_email}
    birthday              {Faker::Date.birthday}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end