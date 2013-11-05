_ = require 'underscore'
_.str = require 'underscore.string'
path = require 'path'

module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'name'
    message: 'Application name'
    default: =>
      _.str.classify path.basename( process.cwd() )
  ,
    type: 'input'
    name: 'version'
    message: 'Current version'
    default: '0.0.0'
  ,
    type: 'input'
    name: 'description'
    message: 'Description'
  ,
    type: 'input'
    name: 'subcommand'
    message: 'subcommand'
  ]

  @prompt prompts, (props) =>
    @app =
      name: props.name
      version: props.version
      description: props.description
      subcommand: props.subcommand
    done()
