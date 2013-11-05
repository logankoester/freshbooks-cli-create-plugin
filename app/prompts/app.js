(function() {
  var path, _;

  _ = require('underscore');

  _.str = require('underscore.string');

  path = require('path');

  module.exports.prompt = function() {
    var done, prompts,
      _this = this;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'name',
        message: 'Application name',
        "default": function() {
          return _.str.classify(path.basename(process.cwd()));
        }
      }, {
        type: 'input',
        name: 'version',
        message: 'Current version',
        "default": '0.0.0'
      }, {
        type: 'input',
        name: 'description',
        message: 'Description'
      }, {
        type: 'input',
        name: 'subcommand',
        message: 'subcommand'
      }
    ];
    return this.prompt(prompts, function(props) {
      _this.app = {
        name: props.name,
        version: props.version,
        description: props.description,
        subcommand: props.subcommand
      };
      return done();
    });
  };

}).call(this);
