const {src, dest, series, parallel, watch} = require("gulp");
const babel = require('gulp-babel');
const sass = require("gulp-sass");
const postcss = require("gulp-postcss");
const autoprefixer = require("autoprefixer");
const cssnano = require("cssnano");
const concat = require("gulp-concat");
const uglify = require("gulp-uglify");
const browserSync = require('browser-sync').create();
const rename = require('gulp-rename');

const paths = {
    scssPath: "./src/scss/*.scss",
    jsPath: "./src/js/*.js",
};

function scssTask() {
    return src(paths.scssPath)
        .pipe(sass())
        .pipe(dest('dist/css'))
        .pipe(rename({suffix: '.min'}))
        .pipe(postcss([autoprefixer, cssnano]))
        .pipe(dest('dist/css'))
        .pipe(browserSync.stream())
}

function jsTask() {
    return src([paths.jsPath])
        .pipe(babel({
            presets: ['@babel/env']
        }))
        .pipe(dest('./dist/js'))
        .pipe(rename({suffix: '.min'}))
        .pipe(uglify())
        .pipe(dest('./dist/js'))
}

function watchTask() {
    browserSync.init({
        server: {
            baseDir: './'
        }
    });

    watch(
        [paths.scssPath, paths.jsPath],
        parallel(scssTask, jsTask)
    );
    watch('./demos/**/*.html').on('change', browserSync.reload);
    watch(paths.jsPath).on('change', browserSync.reload);
}

exports.default = series(
    parallel(scssTask, jsTask),
    watchTask
);
