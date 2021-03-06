FunctionDecorator = (args) ->
  {func, pre, post} = args
  (fargs...) ->
    pre? func, fargs...
    func? fargs...
    post? func, fargs...

class ClassDecorator

  constructor: (args) ->
    {object, pre, post} = args
    dech = (key, value) ->
      if typeof value is 'function'

        return (args...) ->
          console.log "1: ", args
          console.log "2: ", args...
          pre? key, value, args...
          value? args...
          post? key, value, args...
          value
      else
        return value
    for key, value of object
      @[key] = dech(key, value)
module.exports.ClassDecorator = ClassDecorator
module.exports.FunctionDecorator = FunctionDecorator
