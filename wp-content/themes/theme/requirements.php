<?
  add_action("after_switch_theme", function(){
    switch_theme( WP_DEFAULT_THEME );
    unset( $_GET['activated'] );
    add_action( 'admin_notices', function(){
      printf( '<div class="error"><p>%s</p></div>', "Wordpressのバージョンは4.7-alpha以上、PHPは5.6以上が必要です");
    });
    if(defined("WP_CLI")  AND WP_CLI)
      WP_CLI::error("Wordpressのバージョンは4.7-alpha以上、PHPは5.6以上が必要です");  
  });
  add_action("load-customize.php",function(){
    wp_die("Wordpressのバージョンは4.7-alpha以上、PHPは5.6以上が必要です");
  });
  add_action("template_redirect", function(){
    if(!isset($_GET['preview']))return;
    wp_die("Wordpressのバージョンは4.7-alpha以上、PHPは5.6以上が必要です");
  });
