<?
namespace Artovenry\Wpack;

class Renderer{
  private $executor;
  private $path;
  private $name;
  private $args;

  function __construct($name, $args=[]){
    $haml= new \MtHaml\Environment("php");
    $this->executor= new \MtHaml\Support\Php\Executor($haml,["cache"=> sys_get_temp_dir() . "/haml"]);
    $this->name= $name;
    $this->args= $args;
    $this->path= join("/", [get_template_directory(), "views", $name]);
  }

  function render(){
    if(preg_match("/\.haml$/", $this->name)):
      $this->executor->display($this->path, $this->args);
    elseif(preg_match("/\.php$/", $this->name)):
      include($this->path);
    elseif(ART_ENV === "development"):
      exit("Template Not Found!");
    endif;
  }
}