do ($= jQuery)->
  $body= $("body")
  custom= (arg, callback)->
    wp.customize arg, (value)->
      value.bind callback

  wp.customize.bind "preview-ready", ->
    $(".panel-placeholder").hide()
    wp.customize.preview.bind "section-highlight", (data)->
      return unless $body.hasClass("twentyseventeen-front-page")
      state= if data.expanded is true
        $(".panel-placeholder").slideDown 200, ->
          $.scrollTo $("#panel1"),
            duration: 600
            offset: top: -70
      else
        $(".panel-placeholder").slideup 200
      $body.toggleClass "highlight-front-sections", state

  custom "blogname", (to)->
    $(".site-title a").text to
  custom "blogname", (to)->
    $("p.site-description").text to
  custom "header_textcolor", (to)->
    $target= $(".site-title, .site-description")
    state= if to is "blank"
      $target.css
        clip: 'rect(1px 1px 1px 1px)'
        position: "absolute"
    else
      $target.css
        clip: "auto"
        position: "relative"
        color: to
      unless to.length
        $('#twentyseventeen-custom-header-styles').remove()
    $body.toggleClass "title-tagline-hidden", state






