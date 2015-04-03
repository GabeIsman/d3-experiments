var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var path      = require('path');
var csv       = require('csv');
var Transform = require('stream').Transform;



var Where = function(options, predicate) {
  if (!_.isFunction(predicate)) {
    this.throwError_('You must pass a condition function');
  }
  this.predicate = predicate;

  Transform.call(this, options);
};
util.inherits(Where, Transform);
Where.NAME = 'Where';


Where.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    var data = JSON.parse(file.contents);
    var header = data[0];
    var filteredData = _.filter(data, function(row, index) {
      if (index === 0) {
        return true;
      }

      return this.predicate(_.object(header, row));
    }, this);

    file.contents = new Buffer(JSON.stringify(filteredData));
    this.push(file);
    return done();
  }
};


Where.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: Where.NAME,
    message: Where.NAME + ': ' + message
  }));
};


var factory = function(columns) {
  return new Where({ objectMode: true }, columns);
};


module.exports = factory;
