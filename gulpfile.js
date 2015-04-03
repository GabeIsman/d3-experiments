var gulp = require('gulp');

var rename = require('gulp-rename');

var parseCsv = require('./tasks/parsecsv');
var stringifyCsv = require('./tasks/stringifyCsv');
var filterColumns = require('./tasks/filtercolumns');
var renameColumns = require('./tasks/renameColumns');
var where = require('./tasks/where');
var objectify = require('./tasks/objectify');


gulp.task('blacktotals', function() {
  gulp.src('srcdata/ICPSR_34981/DS0001/34981-0001-Data.tsv')
    .pipe(parseCsv({delimiter: '\t', auto_parse: true}))
    .pipe(filterColumns(['STATE', 'STATEID', 'YEAR', 'BLACKM', 'TOTRACEM', 'BLACKF', 'TOTRACEF']))
    .pipe(renameColumns({
      STATEID: 'fips',
      BLACKF: 'black_women',
      BLACKM: 'black_men',
      TOTRACEM: 'total_men',
      TOTRACEF: 'total_women'
    }))
    .pipe(where(function(row) {
      return row.year > 1980
    }))
    .pipe(rename({
      basename: 'blacktotals'
    }))
    .pipe(stringifyCsv({delimiter: '\t'}))
    .pipe(gulp.dest('data/'))
    .on('error', function(error) {
      console.log(error);
    });
});

// Regenerate the topojson file.
gulp.task('map:regenerate', ['map:updatedata'], function(done) {

  child_process.exec(
    'topojson --id-property iso_a3 --properties name,iso_a3,+count '+
        '--external-properties ' + paths.students + ' ' +
        '-o countries.topo.json countries.json',
    { cwd: './geodata' },
    function(err, stdout, stderr) {
      console.log(stdout);
      console.log(stderr);
      if (err) {
        console.log('exec error:' + error);
      }
      done(err);
    });
});
