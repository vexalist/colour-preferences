module.exports = (grunt) ->
  grunt.initConfig
    watch:

      css:
        files: ["app/styles/*.scss"]
        tasks: ["sass"]

      html:
        files: ["app/*.haml"]
        tasks: ["haml"]

      js:
        files: ["app/*.coffee"]
        tasks: [""]


    haml:
      dist:
        files: [{
          expand: true,
          cwd: 'app/',
          src:  "**/*.haml",
          dest: "build/",
          ext: '.html'
        }]

    sass:
      dist:
        files:
          "build/styles.css": "app/styles/main.scss"

  grunt.loadNpmTasks "grunt-contrib-haml"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "default", ["watch", "haml"]
