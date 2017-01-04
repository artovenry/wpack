# wpackにようこそ
wpackはWordPress, webpackを使ってサイト立ち上げをする際に利用できるスターターパックです。
最終的にはWordPressのテーマを１つ制作します。

# 誰に向いてる？
もしあなたがこれらキーワードに直面しつつ日頃ウェブサイトを制作している場合には、このスターターパックは有用でしょう：
- WordPress
- docker
- webpack
- coffeescript
- sass
- composer
- bourbon
- jquery
- backbone
- underscore
- haml
- jade
- and so on　(fontawsome, animate.css, normalize.css)...

# 必要なもの
## 必ず必要なもの
- git
- npm

## WordPressテーマ制作する際に必要なもの
- docker-compose (>=1.8.1)



# コンセプト
このスターターパックは、ロントエンドにwebpack、バックエンドにWordPress（以下WP）という二つの軸を想定して作られています。

## フロントエンド
フロントエンドに関わる全てのリソース(js, cssなど)の制作のスタートを楽にきれるように`webpack.config.coffee`をセットアップしてあります。制作をスタートする際には、 `npm i -D`して`npm start`するだけです。詳しくは`webpack.config.coffee`ファイルの中に全て書かれています。また、必要に応じ適宜編集して、自分にあったフロントエンド環境を作ってください。

## バックエンド
開発用サーバー群はdockerで自動構築、WPはwp-cliを通じて自動インストールします。なので、PHPのバージョン、WPのバージョンなど、細かい設定は全て`docker-compose.yml`, `wp-cli.yml`で行えば完了します。


```
git clone https://github.com/artovenry/wpack ./theme && cd ./theme
npm i -D

```
