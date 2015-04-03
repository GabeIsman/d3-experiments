var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var Transform = require('stream').Transform;



var RenameColumns = function(options, columns) {
  this.columns = columns || {};

  Transform.call(this, options);
};
util.inherits(RenameColumns, Transform);
RenameColumns.NAME = 'RenameColumns';


RenameColumns.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    var data = JSON.parse(file.contents);
    data[0] = _.map(data[0], function(column) {
      return this.columns[column] || column.toLowerCase();
    }, this);
    file.contents = new Buffer(JSON.stringify(data));
    this.push(file);
    return done();
  }
};


RenameColumns.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: RenameColumns.NAME,
    message: RenameColumns.NAME + ': ' + message
  }));
};


var factory = function(columns) {
  return new RenameColumns({ objectMode: true }, columns);
};


module.exports = factory;
