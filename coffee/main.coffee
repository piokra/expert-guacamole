WindowManager = require('./wmgr')
{ClassDecorator} = require('./decorators')
$ = require('../jquery-3.1.0.js')
console.log "Hello"

$(document).ready () ->
  console.log "Greetings from WindowManager"
  document.windowManager = new WindowManager parent: document.body
  document.windowManager.hello = () -> console.log "Hello"
  document.windowManager = new ClassDecorator
    object: document.windowManager
    pre: (key, value, args...) ->
      console.log "Called/Requested #{key}"
      console.log "Got #{value}" if value?
      if args? and args.len
        console.log "With arguments:"
        console.log args...


  document.windowManager.createNewWindow()
