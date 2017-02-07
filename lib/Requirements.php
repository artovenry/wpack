<?
namespace Artovenry\Wpack;
class Requirements{
  static function check(){}
  // Requirements: PHP 5.6+, WP 4.7+
  if(
    version_compare($GLOBALS["wp_version"],"4.7-alpha","<")
    or
    version_compare(PHP_VERSION,"5.6","<")
  ){
    add_action("template_redirect", function(){
      if(isset())
    })
  }

}
