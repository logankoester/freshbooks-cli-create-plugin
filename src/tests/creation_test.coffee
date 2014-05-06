#global describe, beforeEach, it

path = require 'path'
helpers = require('yeoman-generator').test

describe 'generator', ->

  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'tmp'), (err) =>
      return done(err) if err
      @app = helpers.createGenerator('freshbooks:plugin', [
        [require('../app'), 'freshbooks:plugin']
      ])
      done()

  it 'creates expected files', (done) ->
    
    # add files you expect to exist here.
    expected = [
      '.gitignore',
      '.editorconfig',
      '.travis.yml',
      'package.json',
      'Gruntfile.coffee',
      'LICENSE-MIT',
      'bin/freshbooks-test',
      'src/index.coffee',
      'src/lib/mock_freshbooks.coffee',
      'src/tests/index_test.coffee',
      'src/tests/config_file',
      'readme/contributing.md',
      'readme/examples.md',
      'readme/license.md',
      'readme/overview.md',
      'readme/usage.md'
    ]
    helpers.mockPrompt @app,
      name: 'test-plugin'
      version: '0.1.0'
      description: 'A test plugin'
      subcommand: 'test'
      author:
        name: 'Test Author'
        email: 'author@example.com'
        url: 'https://author.example.com'
      githubUsername: 'testuser'

    @app.run {}, ->
      helpers.assertFiles expected
      done()
