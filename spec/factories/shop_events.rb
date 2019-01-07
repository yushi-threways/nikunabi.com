FactoryBot.define do
  factory :shop_event do
    title { "MyString" }
    content { "MyText" }
    images { "MyString" }
    closed_at { "2018-12-19" }
    published { false }
  end
end
