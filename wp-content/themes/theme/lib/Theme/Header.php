<?
namespace Artovenry\Wpack\Theme;
use Artovenry\Wpack\Theme;

// TODO ヘッダーの文字色

class LOGO{
  const WIDTH= 250;
  const HEIGHT= 250;
  static function init(){
    add_theme_support("custom-logo",[
      "width"     =>  self::WIDTH,
      "height"    =>  self::HEIGHT,
    ]);
  }
}

class Header{
  const WIDTH= 800;
  const HEIGHT= 200;
  const VIDEO= true;
  static function init(){
    add_theme_support("custom-header", [
      "default-image"       =>  self::placeholder(),
      "width"               =>  self::WIDTH,
      "height"              =>  self::HEIGHT,
      "video"               =>  self::VIDEO,
      "flex-width"          =>  true,
      "flex-height"         =>  true,
      "random-default"      =>  false,
      "header-text"         =>  true,
    ]);
    register_default_headers([
      "default-image"   =>  [
        "url"           =>  self::placeholder(),
        "thumbnail_url" =>  self::placeholder(),
        "description"   =>  "デフォルトのヘッダー画像"
      ]
    ]);
    // TODO customizing header video's control
    add_filter("header_video_settings", function($settings){
      return $settings;
    });
  }

  private static function placeholder(){
    return sprintf("https://placehold.it/%dx%d/112ae8/000000", self::WIDTH, self::HEIGHT);
  }
}