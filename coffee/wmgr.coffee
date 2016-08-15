Window = require './window'
class WindowManager

  constructor: (args) -> #
    {@parent, @buttonSize = 80} = args
    @windows = []
  createNewWindow: (args) =>
    args ?= {}
    args.parent = this
    ret = new Window args
    console.log "this:", this
    @parent.appendChild(ret.dom)
    @windows.push ret




module.exports = WindowManager
