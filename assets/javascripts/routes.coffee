app = require './application.coffee'

app.config ($routeProvider, $locationProvider) ->
  $routeProvider.when '/messages/:messageId',
    templateUrl: '/message.htm'
    controller: 'MessageController'
    name: 'message'
  $routeProvider.when '/inbox',
    templateUrl: '/inbox.htm'
    controller: 'MessagesController'
    name: 'inbox'
  $routeProvider.when '/sent',
    templateUrl: '/inbox.htm'
    controller: 'MessagesController'
    name: 'sent'
  $routeProvider.when '/trash',
    templateUrl: '/inbox.htm'
    controller: 'MessagesController'
    name: 'trash'
  $routeProvider.when '/starred',
    templateUrl: '/inbox.htm'
    controller: 'MessagesController'
    name: 'starred'
  $routeProvider.when '/compose',
    templateUrl: '/compose.htm'
    controller: 'ComposeController'
    name: 'compose'
  $routeProvider.otherwise redirectTo: '/inbox'

  $locationProvider.html5Mode(true)
