angular.module('rsp_by_csa.home',
  [
    'ngRoute'
  ])

angular.module('rsp_by_csa.csas',
  [
    'ngRoute'
  ])


angular.module('rsp_by_csa', [
  'rsp_by_csa.home',
  'rsp_by_csa.csas'
])

