env=  require "./Webpackfile/environment.coffee"
path= require "path"
_= require "underscore"
entry= require "./Webpackfile/entry.coffee"
postLoaders= require "./Webpackfile/postLoaders.coffee"

webpack= ->
  entry:
    if env isnt "production" and @autoReload is on
      _.mapObject entry, (item)=>
        item.concat "webpack-dev-server/client?http://#{@host}:#{@port}"
    else entry

  output:
    switch env
      when "development"
        path:       path.resolve __dirname, "bundled"
        filename:   "[name].js"
        publicPath: "http://#{@host}:#{@port}"
      when "production"
        path:       path.resolve __dirname, "bundled"
        filename:   "[name]-[hash:6].js"
        publicPath: @assetRootUrl?.production ? "/"
      else
        @output[env]

  devServer: _.defaults @devServer ? {},
    quiet:  off
    noInfo: off
    stats:
      assets:       off
      colors:       on
      version:      on
      hash:         off
      timings:      off
      chunks:       off
      chunkModules: off

  devtool: unless env is "production" then "source-map"

  module:
    loaders: [
      {
        test:     /\.(sa|sc|c)ss$/
        loader:   "css!postcss!sass"
      }
      {
        test:     /\.(gif|jpe?g|png)$/i
        loader:   "url?limit=#{@limitSizeForbundle}&name=[name]-[hash:6].[ext]"
      }
      {
        test:     /\.coffee$/
        loader:   "coffee"
      }
      {
        test:     /\.jade$/
        loader:   "jade"
      }
    ]
    postLoaders: postLoaders
  sassLoader: _.defaults @sassLoader ? {},
    sourceMap: env isnt "production"
    includePaths: _.flatten [
      require('bourbon').includePaths
      require('bourbon-neat').includePaths
      "./node_modules/normalize.css"
    ]
  postcss: ->
    [
      (require "autoprefixer") _.defaults @autoprefixer ? {},
        browsers: ["last 2 versions"]
    ]
  resolve: _.defaults @resolve ? {},
    extensions: ["", ".coffee", ".js"]
  plugins: do ->
    plugins= plugins ? []
    webpack= require "webpack"
    if env is "production" then plugins.concat new webpack.optimize.UglifyJsPlugin
    else plugins

module.exports= do _.bind(webpack, require("./Webpackfile.coffee"))
