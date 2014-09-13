module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    stylus:
      compile:
        files:
          'css/style.css': 'stylus/style.styl'

    watch:
      scripts:
        files: ['stylus/*.styl', 'coffee/*.coffee', 'templates/*.html']
        tasks: ['default']

    connect:
      server:
        options:
          keepalive: true
          port: 8080

    browserify:
      main:
        options:
          browserifyOptions:
            extensions: '.coffee'
          transform: ['coffeeify']
        files:
          'js/all.js': 'coffee/main.coffee'

  require('load-grunt-tasks')(grunt)

  grunt.registerTask 'default', ['stylus', 'browserify']
