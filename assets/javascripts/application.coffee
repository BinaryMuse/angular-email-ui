require './lib/angular.js'
require './lib/angular-resource.js'
require './lib/md5.js'

module.exports = angular.module 'email', ['ngResource']

require './routes.coffee'
require './controllers.coffee'
require './services.coffee'
require './directives.coffee'
