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
        files: ["app/styles/*.scss"]
        tasks: ["compass"]

      html:
        files: ["app/*.haml"]
        tasks: ["haml"]

      js:
        files: ["app/scripts/*.coffee"]
        tasks: ["coffee"]

    haml:
      dist:
        files: [{
          expand: true
          cwd: 'app/'
          src:  "**/*.haml"
          dest: "build/"
          ext: '.html'
        }]

    compass:
      dist:
        options:
          sassDir: "app/styles/",
          cssDir: "build/"
          config: '.compass_config.rb'

    coffee:
      dist:
        files:
          "build/application.js": "app/scripts/application.coffee"

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-haml"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-open"

  grunt.registerTask "default", ["connect", "open", "watch"]
