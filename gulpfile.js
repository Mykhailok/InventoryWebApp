/**
 * Created by Shishkov on 15.06.2017.
 */
var gulp = require('gulp'),
    watch = require('gulp-watch'),
    concat = require('gulp-concat'),
    jshint = require('gulp-jshint'),
    uglify = require('gulp-uglify'),
    sourcemaps = require('gulp-sourcemaps'),
    concatCss = require('gulp-concat-css'),
    prefixer = require('gulp-autoprefixer'),
    uglifycss = require('gulp-uglifycss'),
    babel = require('gulp-babel');


///////////////////////////////////////////////////////////

gulp.task('js', function () {
    gulp.src('js/src/*.js')
        .pipe(jshint())
        .pipe(jshint.reporter('default'))
	    .pipe(babel({
		    presets: ['es2015']
	    }))
        .pipe(sourcemaps.init()) //Инициализируем sourcemap
        .pipe(uglify()) //Сожмем наш js
        .pipe(concat("main.min.js"))//
        .pipe(sourcemaps.write()) //Пропишем карты
        //.pipe(gulp.dest('js/dist'));
        .pipe(gulp.dest('src/main/webapp/resources/js'));
});
gulp.task('css', function () {
    return gulp.src('css/src/*.css')
        .pipe(uglifycss({
            "maxLineLen": 80,
            "uglyComments": true
        }))
        .pipe(prefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(concatCss("main.min.css"))
        //.pipe(gulp.dest('css/dist'));
        .pipe(gulp.dest('src/main/webapp/resources/css'));
});

gulp.task('default',['js','css','pages']);
gulp.task('watch', function() {
    gulp.watch('css/src/*.css', ['css']);
    gulp.watch('js/src/*.js', ['js']);
    gulp.watch('html/*.html', ['pages']);
});

gulp.task('pages', function(){
    return gulp.src('html/*.html')
        .pipe(gulp.dest('src/main/webapp/WEB-INF/html'));
});