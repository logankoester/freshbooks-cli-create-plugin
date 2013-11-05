util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'

module.exports = class PluginGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super(args, options, config)
    @args = args
    @options = options

    @sourceRoot path.join __dirname, 'templates'

    @on 'end', ->
      @installDependencies skipInstall: options['skipInstall']

    @pkg = JSON.parse(@readFileAsString(path.join(__dirname, '../package.json')))

PluginGenerator::askFor = ->
  done = @async()
  
  console.log @yeoman

  prompts = [
    type: "confirm"
    name: "someOption"
    message: "Would you like to enable this option?"
    default: true
  ]

  @prompt prompts, (props) ->
    @someOption = props.someOption
    done()

PluginGenerator::app = ->
  @mkdir 'templates'
  @copy '_package.json', 'package.json'

PluginGenerator::projectfiles =  ->
  @copy 'editorconfig', '.editorconfig'
  @copy 'travis.yml', '.travis.yml'
