(function () {
  'use strict';

  angular.module('components.product')
    .controller('ProductFormController', Controller);

  /** @ngInject */
  function Controller() {
    var ctrl = this;

    ctrl.$onInit = onInit;

    ctrl.onChange = onChange;
    ctrl.doCreate = doCreate;
    ctrl.doUpdate = doUpdate;
    ctrl.doDelete = doDelete;

    ctrl.priceRegEx = /^\d{1,6}(?:\.\d{1,4})?$/;

    function onInit() {
      ctrl.product = angular.copy(ctrl.product);
      ctrl.model = ctrl.product.attributes;
      mapTags();
    }

    function onChange(event) {
      ctrl.model.settings = angular.extend({}, event.settings);
    }

    function doCreate() {
      ctrl.serverErrors = null;

      unmapTags();
      ctrl.onCreate({
        $event: {
          product: ctrl.product
        }
      }).catch(function(errors) {
        ctrl.serverErrors = errors;
      });
    }

    function doUpdate() {
      ctrl.serverErrors = null;

      unmapTags();
      ctrl.onUpdate({
        $event: {
          product: ctrl.product
        }
      }).catch(function(errors) {
        ctrl.serverErrors = errors;
      });
    }

    function doDelete() {
      ctrl.serverErrors = null;

      ctrl.onDelete({
        $event: {
          product: ctrl.product
        }
      }).catch(function(errors) {
        ctrl.serverErrors = errors;
      });
    }

    function mapTags() {
      ctrl.tags = ctrl.model.tag_list.map(function(tag) {
        return {text: tag};
      });
    }

    function unmapTags() {
      ctrl.model.tag_list = ctrl.tags.map(function(tag) {
        return tag.text;
      });
    }
  }
})();
