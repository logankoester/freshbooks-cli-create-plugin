#global describe, beforeEach, it

path = require 'path'
helpers = require('yeoman-generator').test

describe 'generator', ->

  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'tmp'), (err) =>
      return done(err) if err
      @generator = helpers.createGenerator('freshbooks:plugin', [
        ['../../app', 'freshbooks:plugin']
      ])
      done()

  it 'creates expected files', (done) ->
    
    # add files you expect to exist here.
    expected = [
      '.editorconfig',
      '.travis.yml',
      'package.json'
    ]
    helpers.mockPrompt @generator,
      someOption: true

    @generator.options["skip-install"] = true
    @generator.run {}, ->
      helpers.assertFiles expected
      done()
