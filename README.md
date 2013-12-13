# FreshBooks: CLI Create Plugin
> A freshbooks-cli plugin to generate freshbooks-cli plugins

[![Build Status](https://secure.travis-ci.org/logankoester/freshbooks-cli-create-plugin.png?branch=master)](http://travis-ci.org/logankoester/freshbooks-cli-create-plugin)
[![status](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/badges/status.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
[![Dependency Status](https://david-dm.org/logankoester/freshbooks-cli-create-plugin.png)](https://david-dm.org/logankoester/freshbooks-cli-create-plugin)
[![devDependency Status](https://david-dm.org/logankoester/freshbooks-cli-create-plugin/dev-status.png)](https://david-dm.org/logankoester/freshbooks-cli-create-plugin#info=devDependencies)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

[![NPM](https://nodei.co/npm/freshbooks-cli-create-plugin.png?downloads=true)](https://nodei.co/npm/freshbooks-cli-create-plugin/)

## Overview

[freshbooks-cli](https://github.com/logankoester/freshbooks-cli) is a
command-line interface to the [FreshBooks](http://freshbooks.com/) API.

`freshbooks-create-plugin` implements the `create-plugin` subcommand for
[freshbooks-cli](https://github.com/logankoester/freshbooks-cli).

It also happens to be a generator for [Yeoman](http://yeoman.io), though
it does not follow the generator-\_ naming convention.

`freshbooks-create-plugin` runs interactively. It will ask you to answer some
questions about the plugin you are creating, and then generate the necessary
files in the current directory.


## Usage

### Creating your plugin

    $ mkdir freshbooks-cli-myplugin
    $ cd freshbooks-cli-myplugin

    $ freshbooks create-plugin
    # ...

### Editing your plugin

    $ npm link
    $ grunt watch # Automatically rebuild & test on file change events

### Publishing your plugin

    $ npm publish
    $ npm unlink
    $ npm install freshbooks-cli-myplugin -g


## Contributing

To rebuild & run the tests

    $ git clone https://github.com/logankoester/freshbooks-cli-config.git
    $ cd freshbooks-cli-config
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `freshbooks-cli` to use
your modified `freshbooks-cli-create-plugin` during development.

To contribute back, fork the repo and open a pull request with your changes.


## License

Copyright (c) 2013 Logan Koester
Licensed under the MIT license.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/logankoester/freshbooks-cli-create-plugin/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

[![xrefs](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/badges/xrefs.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
[![funcs](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/badges/funcs.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
[![top func](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/badges/top-func.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
[![library users](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/badges/library-users.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
[![authors](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/badges/authors.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
[![Total views](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/counters/views.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
[![Views in the last 24 hours](https://sourcegraph.com/api/repos/github.com/logankoester/freshbooks-cli-create-plugin/counters/views-24h.png)](https://sourcegraph.com/github.com/logankoester/freshbooks-cli-create-plugin)
