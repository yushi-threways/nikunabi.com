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

admin = Admin.create!(password: 'password', email: 'test@admin.jp')
admin.save!

  10.times do |n|
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
    Blog.create!(
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
    )
    end