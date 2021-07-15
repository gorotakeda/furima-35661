FactoryBot.define do
  factory :user do
    nickname       { Faker::Name.name }
    email          { Faker::Internet.free_email }
    password { '1q' + Faker::Internet.password(min_length: 6)} 
    password_confirmation { password }
    last_name       { '武田' }
    first_name      { '吾郎' }
    last_name_kana  { 'タケダ' }
    first_name_kana { 'ゴロウ' }
    birth_date      { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
