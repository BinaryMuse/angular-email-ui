app = require './application.coffee'

app.controller 'ApplicationController', ($scope, $route, navigation) ->
  $scope.navigation = navigation
  $scope.$on '$routeChangeSuccess', ->
    $scope.navigation.current = $route.current.name

app.controller 'MessagesController', ($scope) ->
  $scope.name = 'MessagesController'

app.controller 'ComposeController', ($scope) ->
  $scope.name = 'ComposeController'

app.controller 'MessageController', ($scope, $routeParams) ->
  $scope.messageId = $routeParams.messageId
