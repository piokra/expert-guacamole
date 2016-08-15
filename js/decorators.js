// Generated by CoffeeScript 1.10.0
(function() {
  var ClassDecorator, FunctionDecorator,
    slice = [].slice;

  FunctionDecorator = function(args) {
    var func, post, pre;
    func = args.func, pre = args.pre, post = args.post;
    return function() {
      var fargs;
      fargs = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (typeof pre === "function") {
        pre.apply(null, [func].concat(slice.call(fargs)));
      }
      if (typeof func === "function") {
        func.apply(null, fargs);
      }
      return typeof post === "function" ? post.apply(null, [func].concat(slice.call(fargs))) : void 0;
    };
  };

  ClassDecorator = (function() {
    function ClassDecorator(args) {
      var dech, key, object, post, pre, value;
      object = args.object, pre = args.pre, post = args.post;
      dech = function(key, value) {
        if (typeof value === 'function') {
          return function() {
            var args;
            args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
            if (typeof pre === "function") {
              pre.apply(null, [key, value].concat(slice.call(args)));
            }
            if (value != null) {
              if (typeof value.call === "function") {
                value.call.apply(value, args);
              }
            }
            if (typeof post === "function") {
              post.apply(null, [key, value].concat(slice.call(args)));
            }
            return value;
          };
        } else {
          return value;
        }
      };
      for (key in object) {
        value = object[key];
        this[key] = dech(key, value);
      }
    }

    return ClassDecorator;

  })();

  module.exports.ClassDecorator = ClassDecorator;

  module.exports.FunctionDecorator = FunctionDecorator;

}).call(this);
