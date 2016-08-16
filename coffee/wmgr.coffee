Window = require './window'
class WindowManager

  constructor: (args) -> #
    {@parent, @buttonSize = 80} = args
    @windows = []

  createNewWindow: (args) =>
    args ?= {}
    args.parent = this
    args.zindex = @windows.length+1
    ret = new Window args
    console.log "this:", this
    @parent.appendChild(ret.dom)
    @windows.push ret

  click: (iwin) =>
    for win in @windows
      if iwin != win
        win.changeZIndex -1

    iwin.changeZIndex 1
  toggleShow: (iwin) =>
    console.log "toggleShow: not implemented"

  toggleSize: (iwin) =>
    console.log "toggleSize: not implemented"
module.exports = WindowManager
