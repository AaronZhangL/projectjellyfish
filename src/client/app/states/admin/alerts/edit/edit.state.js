(function() {
  'use strict';

  angular.module('app.states')
    .run(appRun);

  /** @ngInject */
  function appRun(routerHelper, navigationHelper) {
    routerHelper.configureStates(getStates());
    navigationHelper.navItems(navItems());
    navigationHelper.sidebarItems(sidebarItems());
  }

  function getStates() {
    return {
      'admin.alerts.edit': {
        url: '/edit/:id',
        templateUrl: 'app/states/admin/alerts/edit/edit.html',
        controller: StateController,
        controllerAs: 'vm',
        title: 'Admin Alerts Create',
        resolve: {
          alertToEdit: resolveAlert,
          staff: resolveStaff
        }
      }
    };
  }

  function navItems() {
    return {};
  }

  function sidebarItems() {
    return {};
  }

  /** @ngInject */
  function resolveAlert($stateParams, Alert) {
    if ($stateParams.id) {
      return Alert.get({id: $stateParams.id}).$promise;
    } else {
      return {};
    }
  }

  /** @ngInject */
  function resolveStaff(Staff) {
    return Staff.getCurrentMember().$promise;
  }

  /** @ngInject */
  function StateController(logger, alertToEdit, $stateParams, staff) {
    var vm = this;

    vm.title = 'Admin Alerts Edit';
    vm.alertToEdit = alertToEdit;
    vm.activate = activate;
    vm.staffId = staff.id;

    activate();

    function activate() {
      logger.info('Activated Admin Alerts Create View');
    }
  }
})();
