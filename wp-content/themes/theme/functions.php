<?
if(
  version_compare($GLOBALS["wp_version"],"4.7-alpha","<")
  or
  version_compare(PHP_VERSION,"5.6","<")
){
  require __DIR__ . "/requirements.php";
  return;
}
require __DIR__ . "/vendor/autoload.php";

Artovenry\Wpack\AfterSetupTheme::init();
Artovenry\Wpack\Customizer::init();
