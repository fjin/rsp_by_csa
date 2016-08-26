'use strict'

BillingAccountService = ($http) ->
  getAllBillingAccounts: ->
    request = $http.get '/api/v1/get_billing_accounts'
    request.then (result) =>
      @csas = result.data



angular.module('rsp_by_csa').factory('BillingAccountService', BillingAccountService)