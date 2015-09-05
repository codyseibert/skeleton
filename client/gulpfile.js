var gulp = require('gulp');

var browserify = require('gulp-browserify');
var clean = require('gulp-clean');
var del = require('del');

gulp.task('clean', function () {
  del.sync(['build']);
});

gulp.task('copy', function () {
  gulp.src('src/index.html')
    .pipe(gulp.dest('build'));

  gulp.src('node_modules/bootstrap/dist/css/bootstrap.css')
    .pipe(gulp.dest('build/css'));

  gulp.src('node_modules/bootstrap/dist/fonts/*')
    .pipe(gulp.dest('build/fonts'));
});

gulp.task('scripts', function() {
  gulp.src('src/js/main.js')
    .pipe(browserify({}))
    .pipe(gulp.dest('build/js'))
});

gulp.task('watch:js', function() {
  gulp.watch('src/**/*.js', ['clean', 'copy', 'scripts']);
});

gulp.task('watch:html', function() {
  gulp.watch('src/**/*.html', ['clean', 'copy', 'scripts']);
});

gulp.task('default', ['watch:js', 'watch:html']);
