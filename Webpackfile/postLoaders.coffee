path= require "path"
env= require "./environment.coffee"

module.exports=[
  # site.sass
  # プロダクション環境ではハッシュサフィックス付きファイルに抽出する
  site=
    test: path.resolve __dirname, "../src/site.sass"
    loader:
      unless env is 'production'
        "style"
      else
        "file?name=[name]-[hash:6].css!extract"

  # editor.sass
  # プロダクション環境ではハッシュサフィックス付きファイルに抽出する
  # それ以外ではハッシュサフィックス無しファイルに抽出する
  editor=
    test: path.resolve __dirname, "../src/editor.sass"
    loader:
      unless env is "production"
        "file?name=[name].css!extract"
      else
        "file?name=[name]-[hash:6].css!extract"

  # 上記以外のcss-likeなリソースはファイルに抽出しない
  others=
    test: (path)->
      path isnt site.test and
      path isnt editor.test and
      path.match /\.(sa|sc|c)ss$/
    loader: "style"
]
