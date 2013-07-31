module.exports = (grunt) ->
  grunt.initConfig

    connect:
      server:
        options:
          port: 9001
          base: 'build'

    open:
      dev:
        path: 'http://localhost:9001/'

    watch:
      options:
        nospawn: true
        livereload: true

      css:
        files: ['app/styles/*.scss']
        tasks: ['compass']

      html:
        files: ['app/*.haml']
        tasks: ['haml']

      js:
        files: ['app/scripts/*.coffee', 'specs/coffee/*.coffee']
        tasks: ['coffee', 'test']

    haml:
      dist:
        files: [{
          expand: true
          cwd: 'app/'
          src:  '**/*.haml'
          dest: 'build/'
          ext: '.html'
        }]

    compass:
      dist:
        options:
          sassDir: 'app/styles/',
          cssDir: 'build/'
          config: '.compass_config.rb'

    coffee:
      dist:
        files:
          'build/application.js': 'app/scripts/application.coffee',
          'specs/js/application-spec.js': 'specs/coffee/*.coffee'

    jasmine:
      src:     'build/application.js',
      options:
        specs: 'specs/js/application-spec.js'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-haml'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-open'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  grunt.registerTask 'default', ['connect', 'open', 'watch']
  grunt.registerTask 'test', ['coffee', 'jasmine']
  grunt.registerTask 'watch_test', ['watch:js', 'jasmine']
