'use strict';

/**@ngInject*/
function ProjectQuestionsController($scope, $state, projectQuestions) {
  $scope.projectQuestions = projectQuestions;
  $scope.projectQuestion = {};

  $scope.addOption = function() {
    $scope.projectQuestion.options.push('');
  };

  $scope.deleteProjectQuestion = function(question) {
    question.$delete(function() {
      $state.go('base.authed.admin.projects.project_questions', {}, {reload: true});
    });
  };

  $scope.editProjectQuestion = function(question) {
    $state.go('base.authed.admin.projects.edit_project_questions', {id: question.id}, {reload: true});
  };
}

ProjectQuestionsController.resolve = {
  /**@ngInject*/
  projectQuestions: function(ProjectQuestion) {
    return ProjectQuestion.query().$promise;
  }
};

module.exports = ProjectQuestionsController;
