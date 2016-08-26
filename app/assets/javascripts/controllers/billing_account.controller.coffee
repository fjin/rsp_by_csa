# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
'use strict'

BillingAccountsController = ($scope, $http, BillingAccountService)->
  self = this
  $scope.csas = {}


  # init
  # ------------------------------------------------------------

  init = ->
    $scope.controllerName = 'BillingAccountsController'
    $scope.billingAccounts = getAllBillingAccounts($http,$scope)
    return

  getAllBillingAccounts = ($http, $scope) ->
    BillingAccountService.getAllBillingAccounts().then (result) ->
      $scope.billingAccounts = result
      return

  # call init()
  # ------------------------------------------------------------
  init()

  # return a reference to controller itself
  # to avoid returning init(), which causes issues
  self



angular.module('rsp_by_csa.csas').controller('BillingAccountsController', BillingAccountsController)