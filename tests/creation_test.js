(function() {
  var helpers, path;

  path = require('path');

  helpers = require('yeoman-generator').test;

  describe('generator', function() {
    beforeEach(function(done) {
      var _this = this;
      return helpers.testDirectory(path.join(__dirname, 'tmp'), function(err) {
        if (err) {
          return done(err);
        }
        _this.generator = helpers.createGenerator('freshbooks:plugin', [['../../app', 'freshbooks:plugin']]);
        return done();
      });
    });
    return it('creates expected files', function(done) {
      var expected;
      expected = ['.editorconfig', '.travis.yml', 'package.json'];
      helpers.mockPrompt(this.generator, {
        someOption: true
      });
      this.generator.options["skip-install"] = true;
      return this.generator.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

}).call(this);
