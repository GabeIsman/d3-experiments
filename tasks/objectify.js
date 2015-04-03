var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var path      = require('path');
var csv       = require('csv');
var Transform = require('stream').Transform;



var Objectify = function(options) {
  if (!options || !options.indexColumn) {
    this.throwError_('You must specify an indexColumn');
  }
  this.indexColumn = options.indexColumn;

  Transform.call(this, options);
};
util.inherits(Objectify, Transform);
Objectify.NAME = 'Objectify';


Objectify.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    var data = JSON.parse(file.contents);
    var header = data[0];
    if (header.indexOf(this.indexColumn) === -1) {
      this.throwError_('Index column does not exist');
    }

    var groupedData = {};
    _.each(data, function(row, index) {
      if (index === 0) {
        return;
      }

      var obj = _.object(header, row);
      var group = obj[this.indexColumn];
      groupedData[group] = groupedData[group] || [];
      groupedData[group].push(obj);
    }, this);

    file.contents = new Buffer(JSON.stringify(groupedData));
    this.push(file);
    return done();
  }
};


Objectify.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: Objectify.NAME,
    message: Objectify.NAME + ': ' + message
  }));
};


var factory = function(options) {
  return new Objectify(_.extend(options, { objectMode: true }));
};


module.exports = factory;
