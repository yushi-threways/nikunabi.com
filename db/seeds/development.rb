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
               description: "オシャレ空間×王道焼肉",
               email: email,
               telNumber: tel,
               password:              password,
               password_confirmation: password,
               city_id: city_id
             )
  shop.skip_confirmation!
  shop.save!
end

admins = Admin.order(:created_at)
3.times do |n|
  title = "タイトルが入ります"
  content = "内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります内容が入ります"
  admins.each { |admin| admin.blogs.create!(
    title: title,
    content: content,
    image: File.open("./app/assets/images/nikunabi_def.jpg")
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
