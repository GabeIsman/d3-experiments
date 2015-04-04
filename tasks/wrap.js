var util      = require('util');
var gutil     = require('gulp-util');
var path      = require('path');
var _         = require('underscore');
var Transform = require('stream').Transform;



var Wrap = function(options) {
  this.obj = {};
  this.file = null;
  Transform.call(this, options);
};
util.inherits(Wrap, Transform);
Wrap.NAME = 'Wrap';


Wrap.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    this.file = file;
    var data = JSON.parse(file.contents);
    var name = path.basename(file.path, path.extname(file.path));
    this.obj[name] = data;
    return done();
  }
};


Wrap.prototype._flush = function(done) {
  this.file.contents = new Buffer(JSON.stringify(this.obj));
  this.push(this.file);
  return done();
};

Wrap.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: Wrap.NAME,
    message: Wrap.NAME + ': ' + message
  }));
};


var factory = function(options) {
  options = options || {};
  return new Wrap(_.extend(options, { objectMode: true }));
};


module.exports = factory;
