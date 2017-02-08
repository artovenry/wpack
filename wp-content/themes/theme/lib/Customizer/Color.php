<?
namespace Artovenry\Wpack\Customizer;
class Color{
  static function init(){
    add_action("customize_register", function($c){
      $c->add_setting("colorscheme",[
        "default"     =>  "light",
        "transport"   =>  "postMessage",
        "sanitize_callback"=>function($str){
          return preg_match("/^(light|dark|custom)$/", $str) ? $str : "light";
        }
      ]);
      $c->add_setting("colorscheme_hue",[
        "default"     =>  250,
        "transport"   =>  "postMessage",
        "sanitize_callback" => "absint",
      ]);
      $c->add_control("colorscheme",[
        "type"      =>  "radio",
        "label"     =>  "サイト全体の色",
        "choices"   =>  [
          "light"   =>  "light",
          "dark"    =>  "dark",
          "custom"  =>  "custom"
        ],
        "section"   =>  "colors",
        "priority"  =>  5
      ]);
      $c->add_control(new \WP_Customize_Color_Control(
        $c, "colorscheme_hue", ["mode" => "hue", "section"=>"colors", "priority" => 6] 
      ));
    });
  }  
}
