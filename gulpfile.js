var gulp = require('gulp');

var rename = require('gulp-rename');
var merge = require('merge2');

var parseCsv = require('./tasks/parsecsv');
var stringifyCsv = require('./tasks/stringifyCsv');
var filterColumns = require('./tasks/filtercolumns');
var renameColumns = require('./tasks/renameColumns');
var where = require('./tasks/where');
var join = require('./tasks/join');
var objectify = require('./tasks/objectify');
var wrap = require('./tasks/wrap');


gulp.task('totals', function() {
  return merge(
      gulp.src('srcdata/ICPSR_34981/DS0001/34981-0001-Data.tsv')
        .pipe(parseCsv({delimiter: '\t', auto_parse: true}))
        .pipe(filterColumns(['STATE', 'STATEID', 'YEAR', 'JURTOTM', 'JURTOTF']))
        .pipe(renameColumns({
          STATEID: 'fips',
          JURTOTF: 'female',
          JURTOTM: 'male'
        }))
        .pipe(rename({basename: 'totals'})),
      gulp.src('srcdata/fips.csv')
        .pipe(parseCsv({auto_parse: true}))
        .pipe(filterColumns(['NAME', 'FIPS']))
        .pipe(renameColumns())
    )
    .pipe(objectify({indexColumn: 'fips'}))
    .pipe(wrap())
    .pipe(rename({
      basename: 'jurisdiction-totals',
      extname: '.json'
    }))
    // .pipe(stringifyCsv({delimiter: '\t'}))
    .pipe(gulp.dest('data/'))
    .on('error', function(error) {
      console.log(error);
    });
});

var getStateNames = function() {
  return
}
