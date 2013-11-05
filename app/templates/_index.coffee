path = require 'path'
nopt = require 'nopt'
nconf = require 'nconf'
exec = require('child_process').exec

displayHelp = ->
  manpage = path.join(__dirname, 'man', 'freshbooks-<%= app.subcommand %>.1')
  cmd = "man --local-file #{manpage}"
  exec cmd, (err, stdout, stderr) ->
    process.stdout.write "#{stdout}"
    process.stderr.write "#{stderr}"
    console.error err if err

parsedOptions = nopt
  option: String
  help: Boolean
, o: ['--option']
  h: ['--help']
, process.argv, 2

if parsedOptions.help
  displayHelp()

else if parsedOptions.option

  # YOUR CODE HERE
  #
  # Examples:
  #
  #   # Retrieve some item from the freshbooks-config key/value store
  #   someKey = nconf.get 'some:key'

  # ...

else
  displayHelp()
