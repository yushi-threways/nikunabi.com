module ApplicationHelper

  # ページごとの完全なタイトルを返します。                   # コメント行
  def full_title(page_title = '')                     # メソッド定義とオプション引数
    base_title = "ニクナビ 完全無料お肉専門情報サイト"  # 変数への代入
    if page_title.empty?                              # 論理値テスト
      base_title                                      # 暗黙の戻り値
    else
      page_title + " | " + base_title                 # 文字列の結合
    end
  end


  def shallow_args(parent, child)
  child.try(:new_record?) ? [parent, child] : child
  end

  def default_meta_tags
    {
      title:       "ニクナビ 完全無料なごや焼肉情報サイト",
      description: "description",
      keywords:    "焼肉,焼き肉,なごや,名古屋,ニクナビ,肉,栄焼肉,錦焼肉",
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('touch_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      noindex: ! Rails.env.production?, # production環境以外はnoindex
    canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      # OGPの設定をしておくとfacebook, twitterなどの投稿を見た目よくしてくれます。
      og: {
        title: :title, #上のtitleと同じ値とするなら「:title」とする
        description: :description, #上のdescriptionと同じ値とするなら「:description」とする
        type: "website",
        url: request.original_url,
        image: image_url("touch_icon.png"),
        site_name: "ニクナビ",
        locale: "ja_JP"
      }
    }
  end
end
