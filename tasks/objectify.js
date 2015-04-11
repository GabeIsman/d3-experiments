var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var path      = require('path');
var csv       = require('csv');
var Transform = require('stream').Transform;



var Objectify = function(options) {
  // To group objects based on a column pass an indexColumn
  this.indexColumn = options.indexColumn;
  // If you only have a single element per index, you can pass the 'unwrap'
  // option which will turn single-elemnt array into an object.
  this.unwrap = options.unwrap && !!options.indexColumn;

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
    if (this.indexColumn && header.indexOf(this.indexColumn) === -1) {
      this.throwError_('Index column does not exist');
    }

    var groupedData = this.indexColumn ? {} : [];
    _.each(data, function(row, index) {
      if (index === 0) {
        return;
      }

      var obj = _.object(header, row);

      if (this.indexColumn) {
        var group = obj[this.indexColumn];
        groupedData[group] = groupedData[group] || [];
        groupedData[group].push(obj);
      } else {
        groupedData.push(obj);
      }

    }, this);

    if (this.unwrap) {
      _.each(groupedData, function(value, key) {
        if (value.length !== 1) {
          this.throwError_('You passed the unwrap option but the ' + key + ' index has ' + value.length + ' values. Must be exactly 1.');
        }

        groupedData[key] = _.first(value);
      }, this);
    }

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
  options = options || {};
  return new Objectify(_.extend(options, { objectMode: true }));
};


module.exports = factory;
