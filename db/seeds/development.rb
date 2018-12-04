require "csv"

Area.delete_all
CSV.foreach('db/areas.csv') do |row|
  record = {
    :areacode        => row[0],
    :name            => row[1]
  }
  p record
  Area.create!(record)
end

City.delete_all
CSV.foreach('db/cities.csv') do |row|
  record = {
    :citycode        => row[0],
    :city            => row[1],
    :citykana        => row[2]
  }
  p record
  City.create!(record)
end

Scene.delete_all
CSV.foreach('db/detail_scenes.csv') do |row|
  record = {
    :name => row[0]
  }
  p record
  Scene.create!(record)
end

Room.delete_all
CSV.foreach('db/detail_rooms.csv') do |row|
  record = {
    :name => row[0]
  }
  p record
  Room.create!(record)
end

Recommend.delete_all
CSV.foreach('db/recommends.csv') do |row|
  record = {
    :name => row[0]
  }
  p record
  Recommend.create!(record)
end

Feature.create(name: '高級肉')
Feature.create(name: '写真映えメニュー')
Feature.create(name: 'デカ盛りメニュー')
Feature.create(name: 'ヘルシーメニュー')
Feature.create(name: '激辛メニュー')
Feature.create(name: '韓国系メニュー')
Feature.create(name: '食べ放題コース')
Feature.create(name: '飲み放題コース')
Feature.create(name: '食事コース')

Admin.delete_all
admin = Admin.create!(password: 'password', email: 'test@admin.jp')
admin.save!

Shop.delete_all
10.times do |n|
  name = "ショップ名#{n + 1}"
  email = "test-#{n+1}@nikunabi.jp"
  password = "password"
  tel = Faker::PhoneNumber.cell_phone
  shop = Shop.create!(
               name:  name,
               description: "オシャレ空間×王道焼肉",
               email: email,
               telNumber: tel,
               password:              password,
               password_confirmation: password,
             )
  shop.skip_confirmation!
  shop.save!
end

Address.delete_all
10.times do |n|
  zipcode = "460-0022"
  street = "金山3丁目15-18"
  city_id = rand(1..10)
  area_id = rand(1..20)
  shop_id = "#{n + 1}"
  station = "栄"
  address = Address.create!(
               zipcode: zipcode,
               street: street,
               city_id: 23106,
               area_id: 231060005,
               shop_id: shop_id,
               station: station
             )
  address.save!
end

Detail.delete_all
10.times do |n|
  shop_id = "#{n + 1}"
  account = "https://www.instagram.com/explore/locations/577535749246800/?hl=ja"
  party = rand(10..20)
  detail = Detail.create!(
               open: "午前10:00~22:00",
               holiday: "毎週火曜日",
               access: "金山駅から徒歩3分",
               parking: "駐車場有り",
               facility: "無縁ロースター",
               concept: "高級焼肉",
               light: "明るい",
               account: account,
               party: party,
               payment: "カード可（VISA、MASTER、JCB、AMEX、Diners）",
               smoking: "喫煙",
               image: File.open("./app/assets/images/nikunabi_def.jpg"),
               shop_id: shop_id
             )
  detail.save!
end

shops = Shop.order(:created_at)
5.times do |n|
  shop_id = "#{n + 1}"
  feature_id = rand(0..7)
  shops.each { |shop| shop.shop_features.create!(
    shop_id: shop_id,
    feature_id: feature_id
  ) }
end

5.times do |n|
  shop_id = "#{n + 1}"
  recommend_id = rand(0..12)
  shops.each { |shop| shop.shop_recommends.create!(
    shop_id: shop_id,
    recommend_id: recommend_id
  ) }
end

admins = Admin.order(:created_at)
3.times do |n|
  title = "タイトルが入ります"
  content = "内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります"
  admins.each { |admin| admin.informations.create!(
    title: title,
    content: content
    )}
end
