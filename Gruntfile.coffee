DEBUG = process.env.NODE_ENV is 'development'
PUBLIC_PATH = 'www'

module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    cssmin:
      combine:
        files:
          'www/css/main.css': ['www/css/main.css']

    copy:
      build:
        cwd: 'assets'
        src: ['images/*']
        dest: PUBLIC_PATH
        expand: true

    connect:
      server:
        options:
          port: 3000
          useAvailablePort: true
          hostname: '*'
          base: PUBLIC_PATH

    'gh-pages':
      options:
        base: PUBLIC_PATH
      src: ['**']

    stylus:
      compile:
        options:
          compress: !DEBUG
        files:
          PUBLIC_PATH + '/css/main.css': 'styles/main.styl'

    browserify:
      dist:
        files:
          PUBLIC_PATH + '/js/app.js': ['src/app.coffee']
        options:
          transform: ['coffeeify']
          extensions: '.coffee'

    jade:
      compile:
        options:
          data:
            DEBUG: DEBUG
        files:
          PUBLIC_PATH + '/index.html': ['views/index.jade']

    uglify:
      options:
        mangle: false
        nonull: true
        banner: '/*! <%= pkg.name %> <%= grunt.template.today(\'yyyy-mm-dd HH:mm:ss\') %> */\n'
      lib:
        files:
          PUBLIC_PATH + '/js/lib.js': [
            'bower_components/lodash/dist/lodash.js'
            'bower_components/jquery/dist/jquery.js'
          ]
      prod:
        src: [PUBLIC_PATH + '/js/lib.js', PUBLIC_PATH + '/js/app.js']
        dest: PUBLIC_PATH + '/js/app.min.js'

    autoprefixer:
      options: {}     
      no_dest:
        src: PUBLIC_PATH + '/css/main.css'

    watch:
      stylus:
        files: ['styles/**/*.styl']
        tasks: ['stylus']
      browserify:
        files: ['src/**/*.coffee']
        tasks: ['browserify']
      jade:
        files: ['views/**/*.jade']
        tasks: ['jade']
      livereload:
        options:
          livereload: true
        files: [
          PUBLIC_PATH + '/css/main.css'
          PUBLIC_PATH + '/index.html'
          PUBLIC_PATH + '/js/app.js'
        ]

  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-gh-pages'

  grunt.registerTask 'default', ['browserify', 'stylus', 'jade', 'uglify', 'autoprefixer', 'copy']
  grunt.registerTask 'server', ['connect', 'watch']
