var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var path      = require('path');
var csv       = require('csv');
var Transform = require('stream').Transform;



var ParseCsv = function(options) {
  options = options || {};

  // Set defaults.
  this.options = _.extend({
    delimiter: ','
  }, options);

  Transform.call(this, options);
};
util.inherits(ParseCsv, Transform);
ParseCsv.NAME = 'ParseCsv';


ParseCsv.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (['.tsv', '.csv'].indexOf(path.extname(file.path)) === -1) {
    this.throwError_('File ' + file.path + ' not of type (extension) .tsv or .csv');
    return done();
  }

  else if (file.isStream()) {
    this.throwError_('Streaming not supported, input must be a file.');
    return done();
  }

  else if (file.isBuffer()) {
    return csv.parse(file.contents, this.options, _.bind(function(err, data) {
      if (err) {
        throw err;
      }

      file.contents = new Buffer(JSON.stringify(data));
      this.push(file);
      return done();
    }, this));
  }
};


ParseCsv.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: ParseCsv.NAME,
    message: ParseCsv.NAME + ': ' + message
  }));
};


var factory = function(options) {
  return new ParseCsv(_.extend(options, { objectMode: true }));
};


module.exports = factory;
