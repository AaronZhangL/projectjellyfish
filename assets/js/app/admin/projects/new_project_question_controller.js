'use strict';

var _ = require('lodash');

/**@ngInject*/
function NewProjectQuestionController($scope, $state, ProjectQuestion) {
  $scope.projectQuestion = {};

  $scope.submitProject = function() {
    ProjectQuestion.save($scope.projectQuestion.options ? $scope.projectQuestion : _.omit($scope.projectQuestion, 'options'), function() {
      $state.go('base.authed.admin.projects.project_questions', {}, {reload: true});
    });
  };
}

module.exports = NewProjectQuestionController;
