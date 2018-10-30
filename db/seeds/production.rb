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

Feature.delete_all
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