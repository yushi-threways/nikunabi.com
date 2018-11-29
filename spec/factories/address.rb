FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
    zipcode { Faker::Address.postcode }
    building { Faker::Address.building_number }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    station { "最寄駅" }
  end
end