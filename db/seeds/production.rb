require "csv"

CSV.foreach('db/areas.csv') do |row|
  record = {
    :areacode        => row[0],
    :name            => row[1]
  }
  p record
  Area.create!(record)
end

CSV.foreach('db/cities.csv') do |row|
  record = {
    :citycode        => row[0],
    :city            => row[1],
    :citykana        => row[2]
  }
  p record
  City.create!(record)
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

Feature.create(name: '高級肉')
Feature.create(name: '写真映えメニュー')
Feature.create(name: 'デカ盛りメニュー')
Feature.create(name: 'ヘルシーメニュー')
Feature.create(name: '激辛メニュー')
Feature.create(name: '韓国系メニュー')
Feature.create(name: '食べ放題コース')
Feature.create(name: '飲み放題コース')
Feature.create(name: '食事コース')

admin = Admin.create!(password: 'nikunabi_threways_adm', email: 'seki@threways.co.jp')
admin.save!


admins = Admin.order(:created_at)
1.times do |n|
  admin_id = 1
  title = "焼肉のオススメの焼き方"
  subtitle = "冷凍肉とチルド肉"
  content = "焼肉店でお肉を焼く前にそのお肉が冷凍であるかチルド肉（冷凍をかけていないもの）であるかを見極めましょう。冷凍肉の場合は、常温に戻す作業が必要です。焼き方ですが、薄い肉は基本的に何度もひっくり返さない事をオススメします。特に赤身の冷凍肉は要注意。焼いている際、ひっくり返せば返すほど、旨味が逃げていきます。①チルド肉は強火で片面ずつサッと②冷凍肉は中火でゆっくり片面ずつ③冷凍肉で厚切りの場合はすぐに焼かず、まずはそのまま置いておき常温に戻す炭火の場合、火力調整が難しいので、冷凍肉の場合は網の端の方でゆっくり焼くのがポイントです。特に脂の多い肉は炭火での焼き方は難しいです。網の中心部は避け、端すぎないところに置くのが一番かと思います。炭火で焼く際はひっくり返す際に焼く場所をズラしましょう、ススが付きにくくなります。"
  admins.each { |admin| admin.blogs.create!(
    admin_id: admin_id,
    title: title,
    subtitle: subtitle,
    content: content,
    image: File.open("./app/assets/images/kome.jpg")
    )}
end