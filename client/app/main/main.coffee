'use strict'

angular.module 'picnicApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
  .state 'contact',
    url: '/contact/'
    templateUrl: 'app/main/contact.html'
  .state 'about',
    url: '/about/'
    templateUrl: 'app/main/about.html'
  .state 'terms',
    url: '/terms/'
    templateUrl: 'app/main/terms.html'


