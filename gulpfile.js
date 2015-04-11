var gulp = require('gulp');

var rename = require('gulp-rename');
var merge = require('merge2');
var jshint = require('gulp-jshint');
var compass = require('gulp-compass');
var jade = require('gulp-jade');
var source = require('vinyl-source-stream');
var watchify = require('watchify');
var browserify = require('browserify');
var async = require('async');
var _ = require('underscore');
var notify = require('gulp-notify');

var parseCsv = require('./tasks/parsecsv');
var stringifyCsv = require('./tasks/stringifyCsv');
var filterColumns = require('./tasks/filtercolumns');
var renameColumns = require('./tasks/renameColumns');
var where = require('./tasks/where');
var join = require('./tasks/join');
var objectify = require('./tasks/objectify');
var wrap = require('./tasks/wrap');
var combine = require('./tasks/combine');
var prefixColumns = require('./tasks/prefixColumns');

var downloadCensusTables = require('./scripts/download-census-tables');

var DEST = 'public/';
var DATA_DEST = DEST + 'data/';
var APP = 'app/';
var CSS_DEST = DEST + 'css/';



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
        .pipe(where(function(row) { return row.year === 2012; }))
        .pipe(rename({basename: 'totals'}))
        .pipe(objectify({indexColumn: 'fips'})),
      merge(
          gulp.src('srcdata/fips.csv')
            .pipe(parseCsv({auto_parse: true}))
            .pipe(filterColumns(['NAME', 'FIPS']))
            .pipe(renameColumns()),
          gulp.src('srcdata/kaiser-foundation-pop-estimates.csv')
            .pipe(parseCsv({auto_parse: true}))
            .pipe(filterColumns(['Location', 'Total']))
            .pipe(renameColumns({
              Location: 'name',
              Total: 'pop'
            })))
        .pipe(join({joinColumn: 'name'}))
        .pipe(rename({basename: 'populations'}))
        .pipe(objectify({indexColumn: 'fips'})),
      gulp.src('srcdata/us.topo.json'),
      gulp.src('srcdata/josh-begley-us-prisons.csv')
        .pipe(parseCsv({auto_parse: true}))
        .pipe(objectify())
        .pipe(rename({basename: 'prisons'}))
    )
    .pipe(wrap())
    .pipe(rename({
      basename: 'totalsmap',
      extname: '.json'
    }))
    // .pipe(stringifyCsv({delimiter: '\t'}))
    .pipe(gulp.dest(DATA_DEST))
    .on('error', function(error) {
      console.log(error);
    });
});


var censusGqRaceTables = {
  white: 'I', // Non-hispanic.
  black: 'B',
  'native': 'C',
  asian: 'D',
  multiracial: 'G',
  hispanic: 'H',
  islander: 'E',
  // Omitting 'other' because most of the options are people who would
  // (probably) also classify themselves as hispanic, latino, or multiracial.
  total: ''
};

// Columns that are common and useful to all census tables.
var censusColumns = {
  GEOID: 'geoid', // Same as fips, for states
  NAME: 'name', // Display name
  POP100: 'population', // Total population
  'POP100.2000': 'population2000', // Total population in 2000 census
}

// These are the most interesting from the Group Quarters data.
// The name of the table must be appendeded to each of thes.
var censusGqTablesColumns = {
   '003': 'all-prisons', // Correctional facilities for adults
   '004': 'federal-detention', // Federal detention centers
   '005': 'federal-prison', // Federal prisons
   '006': 'state-prison', // State prisons
   '007': 'local-jail', // Local jails and other municipal confinement facilities
   '008': 'correctional-residential', // Correctional residential facilities (halfway house?)
   '009': 'military-prison', // Military disciplinary barracks and jails
   // Institutional, non-correctional juvenile homes omitted.
   '013': 'juvenile', // Correctional facilities intended for juveniles
   // Psychiatric / nursing, etc omitted.
   // Noninstitutional omitted (college dorms, mil. barracks, homeless shelters, job corps, etc.)
};


function getColumnsForGqTable(opt_table, opt_prefix) {
  var table = opt_table || '';
  var prefix = opt_prefix || '';
  return _.object(
    _.map(_.keys(censusGqTablesColumns), function(key) {
      return 'PCT020' + table + key;
    }),
    _.map(_.values(censusGqTablesColumns), function(c) { return prefix + c; }));
}


gulp.task('combine-census-gq-race-tables', function() {
  var streams = _.map(_.keys(censusGqRaceTables), function(key, index) {
    var columnKey = censusGqRaceTables[key];
    var columnMap = _.extend(
      { GEOID: 'geoid' },
      getColumnsForGqTable(columnKey, key + '-' /* prefix */));
    // If this is the first table, then include the general census values
    if (index === 0) {
      columnMap = _.extend({}, censusColumns, columnMap);
    }

    console.log(columnMap);
    return gulp.src(['srcdata/census/gq/' + key + '/*.csv'])
      .pipe(parseCsv({ auto_parse: true }))
      .pipe(rename({ basename: key }))
      .pipe(combine())
      // We need to rename columns at this level because the column names
      // include the table name.
      .pipe(renameColumns(columnMap))
      .pipe(filterColumns(_.values(columnMap)));
  });

  var mergedStream = merge.apply(undefined, streams);

  return mergedStream
    .pipe(join({ joinColumn: 'geoid' }))
    .pipe(objectify({ indexColumn: 'geoid', unwrap: true }))
    .pipe(rename({ basename: 'gq-races', extname: '.json' }))
    .pipe(gulp.dest(DATA_DEST));
});

gulp.task('download-census-gq-race-tables', function(callback) {
  return async.each(_.keys(censusGqRaceTables), function(key, done) {
    downloadCensusTables('PCT20' + censusGqRaceTables[key], 'srcdata/census/gq/' + key, done);
  }, function(err) {
    if (err) {
      throw err;
    }

    callback();
  });
});


gulp.task('lint', function() {
  gulp.src(['./app/**/*.js', './tasks/**/*.js', 'gulpfile.js'])
    .pipe(jshint())
    .pipe(jshint.reporter('default'));
});


// Monitor js files and rebuild dependency trees on change
gulp.task('bundlejs', function() {
  var bundler = watchify(browserify('./' + APP + 'javascript/index.js', watchify.args));

  bundler.on('update', rebundle);

  function rebundle() {
    return bundler.bundle()
      .on('error', notify.onError("JS error: <%= error.message %>"))
      .pipe(source('build.js'))
      .pipe(gulp.dest(DEST + '/javascript/'));
  }

  return rebundle();
});

// Monitor less and main jade template for changes
gulp.task('watch', function() {

  gulp.watch(APP + '/stylesheets/**', ['styles']);
  gulp.watch(APP + '/templates/*.jade', ['html']);
});

// Render jade template to html
gulp.task('html', function() {
  gulp.src(APP + '/templates/index.jade')
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest(DEST))
    .on("error", notify.onError("Html error: <%= error.message %>"));
});

// Watch less files for changes and compile to css
gulp.task('styles', function() {
  gulp.src(APP + '/stylesheets/**/*.scss')
    .pipe(compass({
      sass: APP + 'stylesheets/',
      css: DEST + 'css/',
      image: DEST + 'images/',
      font: DEST + 'fonts/'
    }))
    .pipe(gulp.dest(DEST + 'css/'))
    .on("error", notify.onError("Styles error: <%= error.message %>"));
});
