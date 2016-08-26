'use strict'

CsaService = ($http) ->
    getCsas: ->
      request = $http.get '/api/v1/get_csas'
      request.then (result) =>
        @csas = result.data



angular.module('rsp_by_csa').factory('CsaService', CsaService)