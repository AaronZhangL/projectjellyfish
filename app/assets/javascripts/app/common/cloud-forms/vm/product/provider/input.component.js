(function () {
  'use strict';

  angular.module('common')
    .component('cloudFormsVmProductProvider', {
      templateUrl: 'common/cloud-forms/vm/product/provider/input.html',
      controller: 'CloudFormsVmProductProviderController',
      bindings: {
        item: '<',
        provider: '<',
        onSelect: '&?'
      }
    });
})();
