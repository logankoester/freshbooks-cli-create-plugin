(function() {
  module.exports.prompt = function() {
    var done, prompts;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'name',
        message: 'Your name'
      }, {
        type: 'input',
        name: 'email',
        message: 'Your email'
      }, {
        type: 'input',
        name: 'url',
        message: 'Your homepage'
      }, {
        type: 'input',
        name: 'github',
        message: 'Github username'
      }
    ];
    return this.prompt(prompts, (function(_this) {
      return function(props) {
        _this.author = {
          name: props.name,
          email: props.email,
          url: props.url,
          github: props.github
        };
        return done();
      };
    })(this));
  };

}).call(this);
