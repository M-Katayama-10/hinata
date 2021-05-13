FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    member                { '田中' }
    history               { '10年' }
  end
end