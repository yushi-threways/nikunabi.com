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
               password_confirmation: password
             )
  shop.skip_confirmation!
  shop.save!
end

Address.delete_all
10.times do |n|
  zipcode = "460-0022"
  street = "金山3丁目15-18"
  city_id = rand(1..10)
  area_id = rand(1..8)
  shop_id = "#{n + 1}"
  station = "栄"
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
  feature_id = rand(1..7)
  shops.each { |shop| shop.shop_features.create!(
    shop_id: shop_id,
    feature_id: feature_id
  ) }
end

5.times do |n|
  shop_id = "#{n + 1}"
  recommend_id = rand(1..12)
  shops.each { |shop| shop.shop_recommends.create!(
    shop_id: shop_id,
    recommend_id: recommend_id
  ) }
end

admins = Admin.order(:created_at)
1.times do |n|
  admin_id = 1
  title = "RICE is BEAUTIFUL !!!"
  subtitle = "お米と肉のコラボ"
  content = "日本の心、伝統と食を結びつけるものを語ろうと思えば、お米の存在を避けては通れません。日本のお米は、もっちりと柔らかく噛みしめるとお米本来の旨味を感じられます。日本のお米のおいしさは水にあるといえます。日本は世界の中で一番と言っても過言ではないほど、水の綺麗な国であります。清らかな水を使って育てられ、収穫され、炊かれたお米は、日本特有の伝統品となりました。日本のお米の良さは主張しない主食、何にでも合わせる事の出来るまさにカメレオン的な存在といえるでしょう。焼肉店において米の存在は欠かせません。お米が美味しくない焼肉店は流行らないと言われているほど、重要です。タレに付けられたお肉をさっと炙り、お米と一緒に頂きます。甘辛いタレが輝く真っ白なお米と絶妙にマッチしています。お米の良さは栄養バランスにあります。お米は栄養素の中で炭水化物に含まれ、分解され糖として体内に吸収されます。その為、炭水化物が肥満の原因とされた事がありました。しかし、お米の成分の中には、炭水化物と同等くらいタンパク質も含んでいます。タンパク質は筋肉を作り、筋肉は脂肪燃焼に役立つので、タンパク質の摂取はダイエットに繋がります。実は、炭水化物の中でお米というのはダイエット食となるのです。そして、お肉こそ貴重なタンパク源、焼肉ではお肉を網で焼くことで余分な脂を落とします。野菜も一緒に頂くことで、身体の基盤を作る良い食事が出来るといえます。"
  secondtitle = "We grew up with “和” that is mind of JAPAN."
  secondsubtitle = "和の心を知り、日本を知る"
  secondcontent = "焼肉には長年培われていた伝統があります。明治天皇の時代に食肉が解放され、早150年の月日が経ちました。焼肉のルーツを辿ると昭和20年、東京は「明日館」大阪は「食堂園」というお店に着きます。昭和55年には株式会社シンポが無煙ロースターを開発し、焼肉の悩みであった煙の臭いが軽減されました。このような歴史の中で、焼肉は海外の方から日本食と呼ばれる中の１つのジャンルになっているといえます。そして、日本のレストランにはいたるところに和の作法が見られます。和の作法とは「奥ゆかしさ」（＝深い心遣い）と言われます。飲食店の接客１つにしても和の作法は現れてきます。深々と頭を下げる挨拶、海外から日本に来られた方は驚くことが多いと思います。お店に来ていただいた方々に感謝の気持ちを示すものだと感じてください。これは余談となりますが、和と焼肉がコラボした面白いものがあります。それは焼肉一首です。日本には百人一首という札遊びがあります。読み手が5・7・5のリズムで書かれた札を読み、それに当てはまる札を相手よりも早く取る競技です。焼肉一首ではお互いに箸を持ち、読み手が読み上げた肉の部位の特徴を聞き、その部位を箸で取り合うゲームとなっています。日本でもあまり知られていないお遊戯ではありますが、日本の食肉ブームを感じさせるユーモアに溢れた競技です。"
  admins.each { |admin| admin.blogs.create!(
    admin_id: admin_id,
    title: title,
    subtitle: subtitle,
    content: content,
    image: File.open("./app/assets/images/kome.jpg"),
    secondtitle: secondtitle,
    secondsubtitle: secondsubtitle,
    secondcontent: secondcontent,
    secondimage: File.open("./app/assets/images/meet.jpg")
    )}
end
