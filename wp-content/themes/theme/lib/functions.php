<?
if(!function_exists("render")){
  function render($name, $args= []){
    return (new Artovenry\Wpack\Renderer($name, $args))->render();
  }
}