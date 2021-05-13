FactoryBot.define do
  factory :tweet do
    days                  { Faker::Date.in_date_period }
    dayofweek_id          { 2 }
    member_id             { 15 }
    program               { 'ヘキサゴン' }
    time                  { '10:00' }
    endtime               { '10:35' }
    supplement            { '最終回' }

    association :user
  end
end