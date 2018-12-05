require "csv"

City.delete_all
CSV.foreach('db/cities.csv') do |row|
  record = {
    :prefecturecode  => row[0],
    :prefecture      => row[1],
    :prefecturekana  => row[2],
    :citycode        => row[3],
    :city            => row[4],
    :citykana        => row[5]
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
20.times do |n|
  name = "ショップ名#{n + 1}"
  email = "test-#{n+1}@nikunabi.jp"
  password = "password"
  tel = Faker::PhoneNumber.cell_phone
  city_id = rand(1..17)
  shop = Shop.create!(
               name:  name,
               description: "オシャレ空間×王道焼肉＝みつ星",
               email: email,
               telNumber: tel,
               password:              password,
               password_confirmation: password,
               city_id: city_id
             )
  shop.skip_confirmation!
  shop.save!
end

Address.delete_all
20.times do |n|
  zipcode = "460-0022"
  street = "金山３丁目15-18"
  building = ""
  shop_id = "#{n + 1}"
  address = Address.create!(
               zipcode: zipcode,
               street: street,
               building: building,
               shop_id: shop_id
             )
  address.save!
end

Detail.delete_all
20.times do |n|
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
3.times do |n|
  title = "タイトルが入ります"
  content = "内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります"
  shops.each { |shop| shop.prides.create!(
    title: title,
    content: content,
    image: File.open("./app/assets/images/nikunabi_def.jpg")
    )}
end


5.times do |n|
  name = "メニュー名#{n + 1}"
  price = rand(1000...6000)
  quantity = "数量が入ります"
  bake = "焼き方が入ります"
  taste = "味つけが入ります"
  comment = "コメントが入ります"
  shops.each { |shop| shop.menus.create!(
    name: name,
    price: price,
    quantity: quantity,
    bake: bake,
    taste: taste,
    comment: comment,
    image: File.open("./app/assets/images/nikunabi_def.jpg")
  ) }
end

ShopRecommend.delete_all
30.times do |n|
  shop_id = rand(1..20)
  recommend_id = rand(1..15)
  shoprecommend = ShopRecommend.create!(
               shop_id: shop_id,
               recommend_id: recommend_id
             )
  shoprecommend.save!
end

DetailScene.delete_all
30.times do |n|
  detail_id = rand(1..20)
  scene_id = rand(1..4)
  shopscene = DetailScene.create!(
               detail_id: detail_id,
               scene_id: scene_id
             )
  shopscene.save!
end

DetailRoom.delete_all
30.times do |n|
  detail_id = rand(1..20)
  room_id = rand(1..4)
  shoproom = DetailRoom.create!(
               detail_id: detail_id,
               room_id: room_id
             )
  shoproom.save!
end

ShopFeature.create(shop_id: 1, feature_id: 1)
ShopFeature.create(shop_id: 1, feature_id: 2)
ShopFeature.create(shop_id: 1, feature_id: 3)
ShopFeature.create(shop_id: 1, feature_id: 4)
ShopFeature.create(shop_id: 2, feature_id: 1)
ShopFeature.create(shop_id: 3, feature_id: 1)
ShopFeature.create(shop_id: 4, feature_id: 1)
ShopFeature.create(shop_id: 5, feature_id: 6)
ShopFeature.create(shop_id: 5, feature_id: 7)

ShopRecommend.create(shop_id: 1, recommend_id: 1)
ShopRecommend.create(shop_id: 1, recommend_id: 2)
ShopRecommend.create(shop_id: 1, recommend_id: 3)
ShopRecommend.create(shop_id: 1, recommend_id: 4)
ShopRecommend.create(shop_id: 2, recommend_id: 1)
ShopRecommend.create(shop_id: 3, recommend_id: 1)
ShopRecommend.create(shop_id: 4, recommend_id: 1)
ShopRecommend.create(shop_id: 5, recommend_id: 6)
ShopRecommend.create(shop_id: 5, recommend_id: 7)

admins = Admin.order(:created_at)
3.times do |n|
  title = "タイトルが入ります"
  content = "内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります"
  admins.each { |admin| admin.blogs.create!(
    title: title,
    content: content,
    image: File.open("./app/assets/images/nikunabi_def.jpg")
    second_title: title,
    second_content: content,
    second_image: File.open("./app/assets/images/nikunabi_def.jpg")
    )}
end

3.times do |n|
  title = "タイトルが入ります"
  content = "内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります"
  admins.each { |admin| admin.informations.create!(
    title: title,
    content: content
    )}
end
