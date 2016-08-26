'use strict'

InboundService = ($http) ->
  getInbounds: ->
    request = $http.get '/api/v1/get_inbounds'
    request.then (result) =>
      @csas = result.data



angular.module('rsp_by_csa').factory('InboundService', InboundService)