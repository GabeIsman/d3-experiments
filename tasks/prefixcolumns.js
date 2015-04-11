var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var path      = require('path');
var csv       = require('csv');
var Transform = require('stream').Transform;



var PrefixColumns = function(options) {
  this.prefix = options.prefix;
  this.excludedColumns = options.excluding || [];

  Transform.call(this, options);
};
util.inherits(PrefixColumns, Transform);
PrefixColumns.NAME = 'PrefixColumns';


PrefixColumns.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    var data = JSON.parse(file.contents);
    var prefix = this.prefix ? this.prefix : path.basename(file.path);
    data[0] = _.map(data[0], function(column) {
      if (this.excludedColumns.indexOf(column) !== -1) {
        return column;
      }

      return prefix + column;
    });

    file.contents = new Buffer(JSON.stringify(data));
    this.push(file);
    return done();
  }
};


PrefixColumns.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: PrefixColumns.NAME,
    message: PrefixColumns.NAME + ': ' + message
  }));
};


var factory = function(options) {
  return new PrefixColumns(_.extend({ objectMode: true }, options));
};


module.exports = factory;
