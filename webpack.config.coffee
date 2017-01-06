env=  require "./Webpackfile/environment.coffee"
path= require "path"
_= require "underscore"

opts= _.defaults (require "./Webpackfile.coffee") ? {},
  limitSizeForbundle: 10000
  autoReload: on
host= opts.devServer?.host ? "localhost"
port= opts.devServer?.port ? 30000

module.exports=
  entry: do ->
    entry= require "./Webpackfile/entry.coffee" ? {}
    if env isnt "production" and opts.autoReload is on
      _.mapObject entry, (item)->
        item.concat "webpack-dev-server/client?http://#{host}:#{port}"
    else entry

  output: (_.defaults opts.output ? {},
    development:
      path:       path.resolve __dirname, "bundled"
      filename:   "[name].js"
      publicPath: "http://#{host}:#{port}"
    production:
      path:       path.resolve __dirname, "bundled"
      filename:   "[name]-[hash:6].js"
      publicPath: "/"
  )[env]

  devServer: _.defaults opts.devServer ? {},
    contentBase: "devServer/"
    host: host
    port: port
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
        loader: "css#{if env isnt 'production' then '?sourceMap' else ''}!postcss-loader!sass"
      }
      {
        test:     /\.(gif|jpe?g|png)$/i
        loader:   "url?limit=#{opts.limitSizeForbundle}&name=[name]-[hash:6].[ext]"
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
    postLoaders: require "./Webpackfile/postLoaders.coffee"
  sassLoader: _.defaults opts.sassLoader ? {},
    sourceMap: env isnt "production"
  postcss: ->
    autoprefixer= require "autoprefixer"
    opts= _.defaults opts.autoprefixer ? {},
      browsers: [
        "last 2 versions"
        "IE >= 9" # Bourbon#v5.0.0.beta.6 and Neat#1.8.0 supports Internet Explorer 9+
      ]
    [autoprefixer(opts)]
  resolve: _.defaults opts.resolve ? {},
    extensions: ["", ".coffee", ".js"]
  plugins: plugins ? do ->
    webpack= require "webpack"
    if env is "production" then [
      new webpack.optimize.UglifyJsPlugin
    ]
