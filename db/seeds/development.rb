require "csv"

Pride.delete_all
Detail.delete_all
Menu.delete_all
Address.delete_all
Area.delete_all
City.delete_all
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
               city_id: city_id,
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
  feature_id = rand(1..7)
  shops.each { |shop| shop.shop_features.create!(
    shop_id: shop_id,
    feature_id: feature_id
  ) }
end

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

admins = Admin.order(:created_at)
1.times do |n|
  admin_id = 1
  title = "RICE is BEAUTIFUL !!!"
  subtitle = "お米と肉のコラボ"
  content = "日本の心、伝統と食を結びつけるものを語ろうと思えば、お米の存在を避けては通れません。日本のお米は、もっちりと柔らかく噛みしめるとお米本来の旨味を感じられます。日本のお米のおいしさは水にあるといえます。日本は世界の中で一番と言っても過言ではないほど、水の綺麗な国であります。清らかな水を使って育てられ、収穫され、炊かれたお米は、日本特有の伝統品となりました。日本のお米の良さは主張しない主食、何にでも合わせる事の出来るまさにカメレオン的な存在といえるでしょう。焼肉店において米の存在は欠かせません。お米が美味しくない焼肉店は流行らないと言われているほど、重要です。タレに付けられたお肉をさっと炙り、お米と一緒に頂きます。甘辛いタレが輝く真っ白なお米と絶妙にマッチしています。お米の良さは栄養バランスにあります。お米は栄養素の中で炭水化物に含まれ、分解され糖として体内に吸収されます。その為、炭水化物が肥満の原因とされた事がありました。しかし、お米の成分の中には、炭水化物と同等くらいタンパク質も含んでいます。タンパク質は筋肉を作り、筋肉は脂肪燃焼に役立つので、タンパク質の摂取はダイエットに繋がります。実は、炭水化物の中でお米というのはダイエット食となるのです。そして、お肉こそ貴重なタンパク源、焼肉ではお肉を網で焼くことで余分な脂を落とします。野菜も一緒に頂くことで、身体の基盤を作る良い食事が出来るといえます。"
  admins.each { |admin| admin.blogs.create!(
    admin_id: admin_id,
    title: title,
    subtitle: subtitle,
    content: content,
    image: File.open("./app/assets/images/meet.jpg")
    )}
end
