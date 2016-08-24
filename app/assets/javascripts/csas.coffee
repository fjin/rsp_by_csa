# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
'use strict'

CsasController = ($scope, $http)->
  self = this
  $scope.csas = {}


  # init
  # ------------------------------------------------------------

  init = ->
    $scope.controllerName = 'CsasController'
    $scope.csas = getAllCsas($http,$scope)
    return

  getAllCsas = ($http, $scope) ->
    $http.get('/api/v1/get_csas').then (result) ->
      $scope.csas = result.data
      return

  getAllInbounds = ($http, $scope) ->
    $http.get('/api/v1/get_inbounds').then (result) ->
      $scope.csas = result.data
      return

  # call init()
  # ------------------------------------------------------------
  init()

  # return a reference to controller itself
  # to avoid returning init(), which causes issues
  self



angular.module('rsp_by_csa.csas')
.controller('CsasController', CsasController)