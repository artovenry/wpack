<?
namespace Artovenry\Wpack;
class AfterSetupTheme{
  static function init(){
    add_action("after_setup_theme", function(){
      Theme\Header::init();
      Theme\Logo::init();
      // add_theme_support('automatic-feed-links');
      // add_theme_support("title-tag");
      // add_theme_support("html5", ["comment-form", "comment-list", "gallery", "caption"]);
      // add_theme_support("post-formats", ["aside", "image", "video", "quote", "link", "gallery", "audio"]);
      // add_theme_support("post-thumbnails");
      // add_image_size( 'twentyseventeen-featured-image', 2000, 1200, true );
      // add_image_size( 'twentyseventeen-thumbnail-avatar', 100, 100, true );
      // add_theme_support("custom-logo", [
      //   "width"   =>  999,
      //   "height"  =>  999,
      //   // "flex-width"  =>  true,
      // ]);



      // add_theme_support("customize-selective-refresh-widgets");
      // add_theme_support("starter-content",[]);



      // Set the default content width.
      // $GLOBALS['content_width'] = 525;

      // register_nav_menus([
      //   "main" => "メインメニュー",
      //   "sub"  => "サブメニュー"
      // ]);
    });
  }  
}

