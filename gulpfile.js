var gulp = require('gulp');

var rename = require('gulp-rename');
var merge = require('merge2');
var jshint = require('gulp-jshint');
var compass = require('gulp-compass');
var jade = require('gulp-jade');
var source = require('vinyl-source-stream');
var watchify = require('watchify');
var browserify = require('browserify');

var parseCsv = require('./tasks/parsecsv');
var stringifyCsv = require('./tasks/stringifyCsv');
var filterColumns = require('./tasks/filtercolumns');
var renameColumns = require('./tasks/renameColumns');
var where = require('./tasks/where');
var join = require('./tasks/join');
var objectify = require('./tasks/objectify');
var wrap = require('./tasks/wrap');

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
    .pipe(gulp.dest(DATA_DEST))
    .on('error', function(error) {
      console.log(error);
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
      .on('error', function(error) { console.log(error); })
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
    .on("error", function(error) {
      console.log(error);
    });
});

// Watch less files for changes and compile to css
gulp.task('styles', function() {
  gulp.src(APP + '/stylesheets/**/*.scss')
    .pipe(compass({
      sass: APP + 'stylesheets/',
      css: DEST + 'css/',
      images: DEST + 'images/'
    }))
    .pipe(gulp.dest(DEST + 'css/'))
    .on("error", function(err) {
      console.log(err);
    });
});
