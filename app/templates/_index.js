(function() {
  var displayHelp, exec, nconf, nopt, parsedOptions, path;

  path = require('path');

  nopt = require('nopt');

  nconf = require('nconf');

  exec = require('child_process').exec;

  displayHelp = function() {
    var cmd, manpage;
    manpage = path.join(__dirname, 'man', 'freshbooks-<%= app.subcommand %>.1');
    cmd = "man --local-file " + manpage;
    return exec(cmd, function(err, stdout, stderr) {
      process.stdout.write("" + stdout);
      process.stderr.write("" + stderr);
      if (err) {
        return console.error(err);
      }
    });
  };

  parsedOptions = nopt({
    option: String,
    help: Boolean
  }, {
    o: ['--option']({
      h: ['--help']
    }, process.argv, 2)
  });

  if (parsedOptions.help) {
    displayHelp();
  } else if (parsedOptions.option) {

  } else {
    displayHelp();
  }

}).call(this);