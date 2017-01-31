(function () {
  'use strict';

  angular.module('common')
    .controller('NewProductCategoryController', Controller);

  /** @ngInject */
  function Controller($state, ProductCategoryService) {
    var ctrl = this;

    ctrl.$onInit = onInit;
    ctrl.onCreate = onCreate;
    ctrl.onCancel = onCancel;

    function onInit() {
      ctrl.productCategory = ProductCategoryService.build();
    }

    function onCreate(event) {
      return ProductCategoryService.create(event.productCategory)
        .then(function (productCategory) {
          $state.go('product-categories.list');
        });
    }

    function onCancel() {
      $state.go('product-categories.list');
    }
  }
})();
