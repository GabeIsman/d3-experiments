var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var path      = require('path');
var Transform = require('stream').Transform;



var Combine = function(options) {
  this.data = null;
  this.file = null;
  Transform.call(this, options);
};
util.inherits(Combine, Transform);
Combine.NAME = 'Combine';


Combine.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    var data = JSON.parse(file.contents);
    if (!this.data) {
      this.data = data;
      this.file = file;
    } else if (!_.isEqual(this.data[0], data[0])) {
      this.throwError_('Headers don\'t match! between' + this.file.path + ' and ' + file.path);
    } else {
      // Delete the header and append the rest.
      data.splice(0, 1);
      this.data = this.data.concat(data);
    }

    return done();
  }
};


Combine.prototype._flush = function(done) {
  this.file.contents = new Buffer(JSON.stringify(this.data));
  this.push(this.file);
  return done();
};

Combine.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: Combine.NAME,
    message: Combine.NAME + ': ' + message
  }));
};


var factory = function(options) {
  options = options || {};
  return new Combine(_.extend(options, { objectMode: true }));
};


module.exports = factory;
