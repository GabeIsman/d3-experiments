var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var path      = require('path');
var csv       = require('csv');
var Transform = require('stream').Transform;



var FilterColumns = function(options, columns) {
  if (!columns || columns.length === 0) {
    this.throwError_('You must specify at least one column');
  }
  this.columns = columns;

  Transform.call(this, options);
};
util.inherits(FilterColumns, Transform);
FilterColumns.NAME = 'FilterColumns';


FilterColumns.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    var data = JSON.parse(file.contents);
    var header = data[0];
    var columnPositions = _.map(this.columns, function(column) {
      var index = header.indexOf(column);
      if (index === -1) {
        return this.throwError_('Column ' + column + ' not found');
      }
      return index;
    }, this);

    var filteredData = _.map(data, function(row) {
      return _.map(columnPositions, function(position) {
        return row[position];
      });
    });
    file.contents = new Buffer(JSON.stringify(filteredData));
    this.push(file);
    return done();
  }
};


FilterColumns.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: FilterColumns.NAME,
    message: FilterColumns.NAME + ': ' + message
  }));
};


var factory = function(columns) {
  return new FilterColumns({ objectMode: true }, columns);
};


module.exports = factory;
