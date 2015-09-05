gulp = require 'gulp'
browserify = require 'gulp-browserify'
clean = require 'gulp-clean'
del = require 'del'
livereload = require 'gulp-livereload'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
sass = require 'gulp-sass'

gulp.task 'clean', ->
  del.sync [ 'build' ]

gulp.task 'copy', ->
  gulp.src('src/index.html')
    .pipe gulp.dest('build')
  gulp.src('node_modules/bootstrap/dist/css/bootstrap.css')
    .pipe gulp.dest('build/css')
  gulp.src('node_modules/bootstrap/dist/fonts/*')
    .pipe gulp.dest('build/fonts')

gulp.task 'jade', ->
  gulp.src 'src/index.jade'
    .pipe jade
      pretty: true
    .pipe gulp.dest 'build'

gulp.task 'coffee', ->
  gulp.src('src/coffee/**/*.coffee')
    .pipe(coffee({bare: true})
    .on('error', gutil.log))
    .pipe(gulp.dest('tmp/js'))

gulp.task 'sass', ->
  gulp.src('src/sass/main.sass')
    .pipe(sass().on('error', gutil.log))
    .pipe(gulp.dest('build/css'))

gulp.task 'scripts', ->
  gulp.src('tmp/js/main.js')
    .pipe(browserify({}))
    .pipe(gulp.dest('build/js'))
    .pipe livereload()

gulp.task 'listen', ->
  livereload.listen()

gulp.task 'watch:coffee', ->
  gulp.watch 'src/**/*.coffee', [ 'build' ]

gulp.task 'watch:jade', ->
  gulp.watch 'src/**/*.jade', [ 'build' ]

gulp.task 'watch:sass', ->
  gulp.watch 'src/**/*.sass', [ 'build' ]

gulp.task 'build', [
  'clean'
  'copy'
  'coffee'
  'jade'
  'sass'
  'scripts'
]

gulp.task 'watch', [
  'listen'
  'watch:coffee'
  'watch:jade'
  'watch:sass'
]

gulp.task 'default', [
  'watch'
]
