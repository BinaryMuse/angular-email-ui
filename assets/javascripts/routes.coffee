app = require './application.coffee'

app.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/inbox',
    templateUrl: '/inbox.htm'
    controller: 'MessagesController'
    name: 'inbox'
  $routeProvider.when '/sent',
    templateUrl: '/sent.htm'
    controller: 'MessagesController'
    name: 'sent'
  $routeProvider.when '/trash',
    templateUrl: '/trash.htm'
    controller: 'MessagesController'
    name: 'trash'
  $routeProvider.when '/compose',
    templateUrl: '/compose.htm'
    controller: 'ComposeController'
    name: 'compose'
  $routeProvider.otherwise redirectTo: '/inbox'

  $locationProvider.html5Mode(true)
