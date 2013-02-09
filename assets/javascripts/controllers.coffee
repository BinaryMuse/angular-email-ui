app = require './application.coffee'

app.controller 'ApplicationController', ($scope, $route, navigation) ->
  $scope.navigation = navigation
  $scope.$on '$routeChangeSuccess', ->
    $scope.navigation.current = $route.current.name

app.controller 'MessagesController', ($scope, $route, navigation, messages) ->
  $scope.name = 'MessagesController'
  $scope.navigation = navigation
  $scope.messages = messages.in($route.current.name)

  $scope.eat = (event) ->
    event.stopPropagation()

app.controller 'ComposeController', ($scope) ->
  $scope.name = 'ComposeController'

app.controller 'MessageController', ($scope, $routeParams, messages) ->
  $scope.message = messages.findById($routeParams.messageId)
  $scope.message.read = true

  $scope.gravatar = (email) ->
    hash = MD5 email.trim()
    "http://gravatar.com/avatar/#{hash}"
