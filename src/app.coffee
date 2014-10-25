app = angular.module 'app', [
  'ngRoute'
  'LocalForageModule'
]

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/home',
    templateUrl: '/home.html'
    controller: 'HomeCtrl'
  ).when('/login',
    templateUrl: '/login.html'
    controller: 'LoginCtrl'
  ).otherwise redirectTo: '/login'
]

app.controller 'HomeCtrl', ['$scope', ($scope) ->
  $scope.listings = ['hello', 'world', '!']
]

app.controller 'LoginCtrl', ['$scope', ($scope) ->
  $scope.user ?= {}
  $scope.login = ->
    console.log 'login', $scope.user
]
