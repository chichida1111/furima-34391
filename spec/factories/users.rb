FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 8) }
    email                 { Faker::Internet.free_email }
    password              { "hoge12" }
    password_confirmation { password }
    last_name_j           { Faker::Japanese::Name.last_name }
    first_name_j         { Faker::Japanese::Name.first_name }
    last_name_k           { 'ナマエ' }
    first_name_k         { 'ミョウジ' }
    birthday              { '2000/1/1' }
  end
end
