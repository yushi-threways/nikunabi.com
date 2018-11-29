FactoryBot.define do
  factory :information do
    title { 'タイトルが入ります' }
    content  { Faker::Base.regexify("[aあ]{30}") }
    association :admin
  end
end