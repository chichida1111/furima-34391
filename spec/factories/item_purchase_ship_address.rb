FactoryBot.define do
  factory :item_purchase_ship_address do
    postal_code      {"123-4567"}
    ship_source_id   {1}
    city             {"市町村"}
    street           {"番地"}
    phone_number     {"09012345678"}
    item_purchase_id {1}
    item_display_id  {1}
    user_id          {1}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end