<?
if(
  version_compare($GLOBALS["wp_version"],"4.7-alpha","<")
  or
  version_compare(PHP_VERSION,"5.6","<")
){
  require __DIR__ . "/lib/requirements.php";
  return;
}
require __DIR__ . "/vendor/autoload.php";

add_action("after_setup_theme", function(){
  require __DIR__ . "/theme.php";  
})
