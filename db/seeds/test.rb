require "csv"

Pride.delete_all
Detail.delete_all
Menu.delete_all
Address.delete_all
Area.delete_all
Scene.delete_all
Room.delete_all
Blog.delete_all
Admin.delete_all
ShopFeature.delete_all
ShopRecommend.delete_all
ShopEvent.delete_all
Shop.delete_all

CSV.foreach('db/areas.csv') do |row|
  record = {
    :areacode        => row[0],
    :name            => row[1]
  }
  p record
  Area.create!(record)
end

CSV.foreach('db/detail_scenes.csv') do |row|
  record = {
    :name => row[0]
  }
  p record
  Scene.create!(record)
end

CSV.foreach('db/detail_rooms.csv') do |row|
  record = {
    :name => row[0]
  }
  p record
  Room.create!(record)
end

CSV.foreach('db/recommends.csv') do |row|
  record = {
    :name => row[0]
  }
  p record
  Recommend.create!(record)
end

10.times do |n|
  name = "ショップ名#{n + 1}"
  email = "test-#{n+1}@nikunabi.jp"
  password = "password"
  tel = Faker::PhoneNumber.cell_phone
  shop = Shop.create!(
               name:  name,
               agreement:  "1",
               description: "オシャレ空間×王道焼肉",
               email: email,
               telNumber: tel,
               password:              password,
               password_confirmation: password
             )
  shop.skip_confirmation!
  shop.save!
end

10.times do |n|
  zipcode = "460-0022"
  street = "金山3丁目15-18"
  city_id = rand(1..10)
  area_id = rand(1..8)
  shop_id = "#{n + 1}"
  station = "金山総合駅"
  address = Address.create!(
               zipcode: zipcode,
               street: street,
               area_id: area_id,
               shop_id: shop_id,
               station: station
             )
  address.save!
end

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
  recommend_id = rand(1..9)
  shops.each { |shop| shop.shop_recommends.create!(
    shop_id: shop_id,
    recommend_id: recommend_id
  ) }
end

3.times do |n|
  shop_id = "#{n + 1}"
  shops.each { |shop| shop.prides.create!(
    shop_id: shop_id,
    title: "イベントの見出しが入ります。",
    content: "イベントの内容が入ります",
    image: File.open("./app/assets/images/kome.jpg")
  ) }
end

3.times do |n|
  shop_id = "#{n + 1}"
  shops.each { |shop| shop.menus.create!(
    shop_id: shop_id,
    name: "メニュー名",
    comment: "コメントが入ります",
    image: File.open("./app/assets/images/kome.jpg"),
    price: "100",
    quantity: "100",
    bake: "焼き方",
    taste: "味付けが入ります"
  ) }
end

admin = Admin.create!(password: 'password', email: 'test@admin.jp')
admin.save!

  6.times do |n|
    id = "#{n + 1}"
    admin_id = 1
    main_title = "メインタイトル"
    title_01 = "タイトル１"
    title_02 = "タイトル２"
    title_03 = "タイトル３"
    title_04 = "タイトル４"
    main_content = Faker::Lorem.paragraph
    content_01 = Faker::Lorem.paragraph
    content_02 = Faker::Lorem.paragraph
    content_03 = Faker::Lorem.paragraph
    content_04 = Faker::Lorem.paragraph
    main_image = File.open("./app/assets/images/kome.jpg")
    image_01 = File.open("./app/assets/images/meet.jpg")
    image_02 = File.open("./app/assets/images/senmai.jpg")
    image_03 = File.open("./app/assets/images/steki.jpg")
    image_04 = File.open("./app/assets/images/tetsu.jpg")
    created_at = Faker::Date.forward(23)
    blogs.each { |blog| Blog.create!(
      id: id, 
      admin_id: admin_id, 
      main_title: main_title, 
      title_01: title_01, 
      title_02: title_02, 
      title_03: title_03, 
      title_04: title_04, 
      main_content: main_content, 
      content_01: content_01, 
      content_02: content_02, 
      content_03: content_03, 
      content_04: content_04, 
      main_image: main_image, 
      image_01: image_01, 
      image_02: image_02, 
      image_03: image_03, 
      image_04: image_04, 
      created_at: created_at
    )}
    end