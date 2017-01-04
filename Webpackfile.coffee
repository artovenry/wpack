path= require "path"
env= require "./Webpackfile/environment.coffee"

module.exports=
  # url-loaderで画像等をバンドルする時のファイルサイズリミット
  limitSizeForbundle: 10000
  # webpack-dev-serverでファイル更新時に自動リロードするか
  autoReload: on

  # 開発用ネットワーク設定
  host: "localhost"
  port: 30000

  # バンドルしたアセットのルートURL(環境名をキーに持つハッシュとしてください)
  # assetRootUrl:
  #   production: "http://example.com/some/asset/url/"

  # development, production以外の環境のバンドルの出力先
  # (環境名をキーに持つハッシュとしてください)
  # output:
  #   staging:
  #     filename: "some-name.js"
  #     publicPath: "http://somedomain/assets"

  # Overriding options for devServer
  # devServer={}


  # Overriding options for sass-loader
  # sassLoader: {}

  # Overriding options for autoprefixer
  # autoprefixer:
  #   browsers:[]

  # Overriding options for resolve
  resolve:
    root:[path.resolve("./src")]
  # Adding plugins
  # plugins: []
