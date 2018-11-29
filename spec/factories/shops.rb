# 
# 生成されたインスタンスの内容をブロック内で自由に修正できる
# 
FactoryBot.define do
  factory :shop do
    name { "ショップネーム" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    description { "店舗説明が入ります" }
    city_id { 1..10 }
    confirmed_at { Date.today }
  end
end