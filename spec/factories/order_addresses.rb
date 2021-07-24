FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '名古屋市熱田区' }
    house_number  { '神宮１−１−１' }
    building      { '熱田マンション202' }
    phone_number  { '09076942240' }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
