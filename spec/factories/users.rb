FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 8) }
    email                 { Faker::Internet.free_email }
    password              { "hoge12" }
    password_confirmation { password }
    last_name_j           { '名字' }
    first_name_j          { '名前' }
    last_name_k           { 'ナマエ' }
    first_name_k          { 'ミョウジ' }
    birthday              { '2000/1/1' }
  end
end
