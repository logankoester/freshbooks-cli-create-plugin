(function() {
  var PluginGenerator, path, util, yeoman,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  util = require('util');

  path = require('path');

  yeoman = require('yeoman-generator');

  module.exports = PluginGenerator = (function(_super) {
    __extends(PluginGenerator, _super);

    function PluginGenerator(args, options, config) {
      PluginGenerator.__super__.constructor.call(this, args, options, config);
      this.args = args;
      this.options = options;
      this.sourceRoot(path.join(__dirname, 'templates'));
      this.on('end', function() {
        return this.installDependencies({
          skipInstall: options['skipInstall']
        });
      });
      this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
    }

    return PluginGenerator;

  })(yeoman.generators.Base);

  PluginGenerator.prototype.askFor = function() {
    var done, prompts;
    done = this.async();
    console.log(this.yeoman);
    prompts = [
      {
        type: "confirm",
        name: "someOption",
        message: "Would you like to enable this option?",
        "default": true
      }
    ];
    return this.prompt(prompts, function(props) {
      this.someOption = props.someOption;
      return done();
    });
  };

  PluginGenerator.prototype.app = function() {
    this.mkdir('templates');
    return this.copy('_package.json', 'package.json');
  };

  PluginGenerator.prototype.projectfiles = function() {
    this.copy('editorconfig', '.editorconfig');
    return this.copy('travis.yml', '.travis.yml');
  };

}).call(this);
