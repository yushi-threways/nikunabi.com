require "csv"

Area.delete_all
City.delete_all
Scene.delete_all
Room.delete_all
Recommend.delete_all
Feature.delete_all
Admin.delete_all
Blog.delete_all

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

admins = Admin.order(:created_at)
1.times do |n|
  admin_id = 1
  title = "お米と焼肉のコラボ"
  subtitle = "日本の伝統"
  content = "日本の心、伝統と食を結びつけるものを語ろうと思えば、お米の存在を避けては通れません。日本のお米のおいしさは水にあるといえます。日本は世界の中で一番と言って過言ではないほど、水の綺麗な国であります。清らかな水を使って育てられ、収穫され、炊かれたお米は、日本特有の伝統品となりました。焼肉店においても米の存在は欠かせません。お米が美味しくない焼肉店は流行らないと言われているほど、重要です。お米の良さは栄養バランスにあります。お米は栄養素の中で炭水化物に含まれ、分解されると糖として体内に吸収されます。その為、炭水化物が肥満の原因とよく言われています。しかし、お米には、タンパク質も多く含んでいます。タンパク質は筋肉を作る働きがあり、筋肉が多いほど脂肪を燃焼します。ダイエットにはタンパク質の摂取が欠かせないのです。実はお米は炭水化物の中で、肥満の原因になりにくいものだったのです。"
  admins.each { |admin| admin.blogs.create!(
    admin_id: admin_id,
    title: title,
    subtitle: subtitle,
    content: content,
    image: File.open("./app/assets/images/meet.jpg")
    )}
end