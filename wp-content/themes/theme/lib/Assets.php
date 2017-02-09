<?
namespace Artovenry\Wpack;

class Assets{
  static function init(){
    if(ART_ENV === "development")
      $customizer_url= ART_DEV_ASSETS_URL . "/customizer.js";
    // else
    //   $url= get_theme_file_uri("/bundled/customizer.js")
    add_action("wp_head", function(){
      render("assets.html.haml");
    });
    add_action("customize_preview_init", function() use($customizer_url){
      wp_enqueue_script("art_wpack-customize-preview", $customizer_url, ["customize-preview"], "1.0", true);
    });
    add_action("customize_controls_enqueue_scripts", function() use($customizer_url){
      wp_enqueue_script("art_wpack-customize-controls", $customizer_url, [], "1.0", true);
    });
  }
}
