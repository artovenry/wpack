<?
namespace Artovenry\Wpack;

class Customizer{
  static function init($modules= "all"){
    $modules=["Color"];
    foreach($modules as $item){
      $moduleclass= __NAMESPACE__ . "\\Customizer\\${item}";
      $moduleclass::init();
    }

    add_action("customize_register", function($c){
      // Auto Reload
      foreach(["blogname", "blogdescription", "header_textcolor"] as $item)
        $c->get_setting($item)->transport = "postMessage";
      $c->selective_refresh->add_partial("blogname", [
        "selector"=>".site-title a",
        "render_callback"=>function(){bloginfo("name");}
      ]);
      $c->selective_refresh->add_partial("blogdescription", [
        "selector"=>".site-description",
        "render_callback"=>function(){bloginfo("description");}
      ]);
      $c->add_section("theme_options",[
        "title"       =>  "せってい",
        "priority"    => 130
      ]);
  $c->add_control( new \WP_Customize_Color_Control( $c, 'colorscheme_hue', array(
    'mode' => 'hue',
    'section'  => 'theme_options',
    'priority' => 6,
  ) ) );
    });
  }
}