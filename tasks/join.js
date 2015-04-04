var util      = require('util');
var gutil     = require('gulp-util');
var _         = require('underscore');
var Transform = require('stream').Transform;



/**
 * Primitive mechanism for combining multiple streams of data into one object.
 * Note that this is much more constrained than a full join since we enforce
 * uniqueness of the join key in the source data (thus creating the
 * source/target distinction), and only allow joins on the '=' operator.
 */
var Join = function(options) {
  if (!options.joinColumn) {
    this.throwError_('You must specify a srcColumn or a targetColumn (in the case that your data is already indexed)');
  }
  this.joinColumn = options.joinColumn;
  // The first file to pass through will be stored here.
  this.data = null;

  Transform.call(this, {objectMode: true});
};
util.inherits(Join, Transform);
Join.NAME = 'Join';


Join.prototype._transform = function(file, encoding, done) {
  if (file.isNull() || file.isDirectory()) {
    this.push(file);
    return done();
  }

  else if (file.isBuffer()) {
    if (!this.data) {
      this.data = JSON.parse(file.contents);
      return done();
    }

    var header = this.data[0];
    var joinData = JSON.parse(file.contents);
    var joinHeader = joinData[0];
    var joinIndexPosition = joinHeader.indexOf(this.joinColumn);
    if (joinIndexPosition === -1) {
      this.throwError_('Join column ' + this.joinColumn + ' not found in ' + joinHeader.toString());
      return done();
    }

    // Delete the header
    joinData.splice(0, 1);

    // Delete the join column from the header.
    joinHeader.splice(joinIndexPosition, 1);
    var indexedJoinData = {};
    _.each(joinData, function(row) {
      var key = row[joinIndexPosition];
      if (indexedJoinData[key] !== undefined) {
        this.throwError_('Key ' + key + ' is duplicated. Joined data must be unique.');
        return done();
      }

      // Delete the index from the record to avoid duplicate data.
      row.splice(joinIndexPosition, 1);
      indexedJoinData[key] = row;
    }, this);


    var indexPosition = header.indexOf(this.joinColumn);
    if (indexPosition === -1) {
      this.throwError_('Join column ' + this.joinColumn + ' not found in ' + joinHeader.toString());
      return done();
    }
    var joinedData = _.map(this.data, function(row, i) {
      // Combine the headers.
      if (i === 0) {
        console.log(row.concat(joinHeader));
        return row.concat(joinHeader);
      }

      var key = row[indexPosition];
      var valuesToJoin = indexedJoinData[key];
      if (valuesToJoin) {
        return row.concat(valuesToJoin);
      } else {
        console.log("Warning: No join data available for ", row[joinIndexPosition]);
      }
      return row;
    }, this);

    file.contents = new Buffer(JSON.stringify(joinedData));
    this.push(file);
    return done();
  }
};


Join.prototype.throwError_ = function(message) {
  this.emit('error', new gutil.PluginError({
    plugin: Join.NAME,
    message: Join.NAME + ': ' + message
  }));
};


var factory = function(options) {
  return new Join(options);
};


module.exports = factory;
