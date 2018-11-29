FactoryBot.define do
  factory :blog do
    title { 'タイトルが入ります' }
    secondtitle { 'セカンドタイトル' }
    subtitle { 'サブタイトルが入ります' }
    secondsubtitle { 'セカンドサブタイトル' }
    content  { Faker::Base.regexify("[aあ]{30}") }
    secondcontent { Faker::Base.regexify("[aあ]{30}") }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/images/bal.jpg'), 'image/jpeg') }
    secondimage { Rack::Test::UploadedFile.new(Rails.root.join('spec/images/bal.jpg'), 'image/jpeg') }
    association :admin
  end
end