require './lib/angular.js'
require './lib/angular-resource.js'

module.exports = angular.module 'email', ['ngResource']

require './routes.coffee'
require './controllers.coffee'
require './services.coffee'
