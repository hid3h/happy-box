module MetaTagHelper
  def default_meta_tags
    {
      title:       t("site_title"),
      description: t("meta_description"),
      # keywords:    "rails,seo,meta-tags",　　#キーワードを「,」で区切る
      icon: [
        # { href: image_url('favicon.ico') },
        # { href: image_url('sample.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      noindex: !Rails.env.production?, # production環境以外はnoindex
	    canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      # OGPの設定をしておくとfacebook, twitterなどの投稿を見た目よくしてくれます。
      # og: {
      #   title:       :title,
      #   description: :description,
      #   type: "website",
      #   url: request.original_url,
      #   image: image_url("sample_og.png"),
      #   site_name: "site name",
      #   locale: "ja_JP"
      # },
      # twitter: {
      #   site: '@ツイッターのアカウント名',
      #   card: 'summary',
      #   image: image_url("sample_twitter.png")　　　# ツイッター専用にイメージを設定する場合
	    # },
      # fb: {
      #   app_id: '***************'    #ご自身のfacebookのapplication IDを設定
      # }
    }
  end
end
