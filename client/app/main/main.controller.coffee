'use strict'

angular.module('picnicApp')
.filter 'recallDate', ($filter) ->
  (input) ->
    return unless input?
    date = new Date input.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3')
    $filter('date')(date, 'MM/dd/yyyy')
.filter 'truncate', ->
  (text, length, end) ->
    if isNaN(length)
      length = 10
    if end == undefined
      end = '...'
    if text.length <= length or text.length - (end.length) <= length
      text
    else
      String(text).substring(0, length - (end.length)) + end
.controller 'MainCtrl', ($scope, $http, usSpinnerService) ->
  $scope.reports = []

  $scope.startSpin = ->
    usSpinnerService.spin 'spinner-1'

  $scope.search = (food) ->
    $scope.reports = []
    $scope.errorMessage = ''
    #todo move to a filter service
    if food
      $scope.searchname = food
      if food.term
        food = food.term

      query = search:
        fields: [
          {
            field: 'reason_for_recall'
            terms: [ { term: food, isExact: "true" } ]
          }
        ]
        limit: value: -1

      #TODO move to a service - ideally a reports model
      queryString = JSON.stringify query
      $http.get("/api/food-search/?search=#{window.btoa queryString}")
        .success (reports) ->
          usSpinnerService.stop 'spinner-1'
          $scope.reports = reports.results
          $scope.meta = reports.meta

        .error (data, status, header, config) ->
          usSpinnerService.stop 'spinner-1'
          if data.error.code
            $scope.errorMessage = data.error.message
          else
            $scope.errorMessage = "Sorry! We didn't find any data with that query. Please revise your search and try again."
    else
      usSpinnerService.stop 'spinner-1' #nothing to search for


