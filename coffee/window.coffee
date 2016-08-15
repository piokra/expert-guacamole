$ = require '../jquery-3.1.0'
class Window

  constructor: (args) ->

    {@parent, @x = 50, @y = 50, @width = 800, @height = 600, @buttonSize = 60,
     @title = "", @buttonSpacing = 12} = args
    [@dom, bar, body, close, minimize, toggleSize] = @divs 6, 'popup-element'
    bar.innerHtml = @title
    $(@dom).addClass('popup')
    $(@dom).append(bar,body)
    $(@dom).css
      top: "#{@y}px"
      left: "#{@x}px"
      width: "#{@width}px"
      height: "#{@height}px"
    $(bar).addClass('popup-bar').css
      height: "#{@buttonSize*1.33}px"
    $(bar).append([close, minimize, toggleSize])
    $(body).addClass('popup-body')
    $([close, minimize, toggleSize]).addClass('popup-bar-button')
      .css("width", "#{@buttonSize}px")
      .css("height", "#{@buttonSize}px")
    counter = @buttonSpacing
    for button in [close,minimize,toggleSize]
      $(button).css("right","#{counter}px")
      counter += @buttonSpacing + @buttonSize


      # body...

  divs: (count,classes) ->
    i=0;
    doms = []
    while i<count
      dom = $('<div>')
      if classes
        dom.addClass(classes)
      doms.push(dom[0]);
      i++
    console.log doms
    doms

module.exports = Window
