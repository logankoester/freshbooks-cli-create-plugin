#
# * <%= app.name %>
# * https://github.com/<%= author.github %>/<%= app.name %>
# *
# * Copyright (c) <%= new Date().getFullYear() %> <%= author.name %>
# * Licensed under the MIT license.
#

path = require 'path'

module.exports = (grunt) ->
  #
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    # Coffeescript
    coffee:
      src:
        expand: true
        cwd: 'src/'
        src: '**/*.coffee'
        dest: '.'
        ext: '.js'

    copy:
      src:
        expand: true
        cwd: 'src/tests'
        src: 'config_file'
        dest: 'tests/'

    clean:
      lib: ['lib/', 'tests/', 'man/']

    watch:
      all:
        files: [
          'src/**/*.coffee',
          'bin/**/*.coffee',
          'Gruntfile.coffee',
          'readme/**/*.md'
        ]
        tasks: ['default']

    nodeunit:
      all: ['tests/**/*_test.js']

    readme_generator:
      help:
        options:
          output: 'freshbooks-<%= app.subcommand %>.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'freshbooks-<%= app.subcommand %>'
          package_name: 'freshbooks-<%= app.subcommand %>'
        order:
          'usage.md': 'Usage'
          'examples.md': 'Examples'
      readme:
        options:
          github_username: '<%= author.github %>'
          generate_footer: false
          table_of_contents: false
        order:
          'overview.md': 'Overview'
          'usage.md': 'Usage'
          'examples.md': 'Examples'
          'contributing.md': 'Contributing'
          'license.md': 'License'

    bump:
      options:
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-readme-generator'
  grunt.loadNpmTasks 'grunt-bump'

  grunt.registerTask 'marked-man', ->
    done = @async()
    grunt.util.spawn
      cmd: './marked-man'
      args: [path.join(__dirname, 'freshbooks-<%= app.subcommand %>.md')]
      opts:
        cwd: path.join(__dirname, 'node_modules', 'marked-man', 'bin')
    , (error, result, code) ->
      throw error if error
      out = path.join __dirname, 'man', 'freshbooks-<%= app.subcommand %>.1'
      grunt.file.write out, result.stdout
      done()

  grunt.registerTask 'build', ['clean', 'coffee', 'copy', 'readme_generator', 'marked-man']
  grunt.registerTask 'test', ['nodeunit']
  grunt.registerTask 'default', ['build', 'test']
