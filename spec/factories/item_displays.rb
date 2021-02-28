FactoryBot.define do
  factory :item_display do
      item_name      { Faker::Name.initials(number: 10) } 
      item_explain   { Faker::Lorem.word }   
      item_price     { Faker::Commerce.price(range: 300..9999999) } 
      ship_burden_id {2}
      ship_source_id {1}
      ship_date_id   {2}
      category_id    {2}
      status_id      {2}
      association :user

      after(:build) do |item_display|
        item_display.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
      end
      
  end
end
