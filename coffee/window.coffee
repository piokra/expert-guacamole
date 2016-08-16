$ = require '../jquery-3.1.0'
class Window

  constructor: (args) ->

    {@parent, @x = 50, @y = 50, @width = 800, @height = 600, @buttonSize = 60,
     @title = "", @buttonSpacing = 12, @zindex = 1} = args
    [@dom, bar, body, close, minimize, toggleSize] = @divs 6, 'popup-element'
    bar.innerHTML = @title
    $(@dom).addClass('popup')
    $(@dom).append(bar,body)
    $(@dom).css
      'z-index': "#{@zindex}"
      top: "#{@y}px"
      left: "#{@x}px"
      width: "#{@width}px"
      height: "#{@height}px"
    $(bar).css "font-size", "#{@buttonSize}px"
    $(bar).addClass('popup-bar').css
      height: "#{@buttonSize*1.33}px"
    $(bar).append([close, minimize, toggleSize])
    $(body).addClass('popup-body')
    $([close, toggleSize, minimize]).addClass('popup-bar-button')
      .css("width", "#{@buttonSize}px")
      .css("height", "#{@buttonSize}px")
    counter = @buttonSpacing
    for button in [close,toggleSize,minimize]
      $(button).css("right","#{counter}px")
      counter += @buttonSpacing + @buttonSize
    toggleSize.addEventListener 'click', @toggleSize
    minimize.addEventListener 'click', @toggleShow
    @maximized = false
    $(bar).mousedown(@onBarClick).mousemove(@onBarMove).mouseup(@onBarUnclick)
      .mouseleave(@onBarMove)
      # body...

  changeZIndex: (diff) =>
    @zindex+=diff
    @zindex = 1 if @zindex < 1
    $(@dom).css "z-index", @zindex

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

  toggleShow: () =>
    $(@dom).toggleClass('hidden')
    @parent.toggleShow this
  toggleSize: () =>
    @maximized = not @maximized
    @updateWindow()
    @parent.toggleSize this
  updateWindow: () =>
    if @maximized
      $(@dom).css
        width: "100vw"
        height: "100vh"
        top: "0px"
        left: "0px"
    else
      $(@dom).css
        top: "#{@y}px"
        left: "#{@x}px"
        width: "#{@width}px"
        height: "#{@height}px"

  move: (x, y) =>
    @x = x
    @y = y
    @updateWindow()

  resize: (width, height) =>
    @width = width
    @height = height
    @updateWindow()
    @parent.resize this

  onBarClick: (ev) =>
    @dragClickX = ev.clientX
    @dragClickY = ev.clientY
    @clicked = true
    @parent.click this
  onBarMove: (ev) =>
    if @clicked
      dx = ev.clientX - @dragClickX
      dy = ev.clientY - @dragClickY
      @move @x+dx, @y+dy
      @dragClickX = ev.clientX
      @dragClickY = ev.clientY

  onBarUnclick: (ev) =>
    @clicked = false
module.exports = Window
