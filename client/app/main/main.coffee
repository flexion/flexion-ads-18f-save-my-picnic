'use strict'

angular.module 'picnicApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
  .state 'about',
    url: '/about/'
    templateUrl: 'app/main/about.html'
