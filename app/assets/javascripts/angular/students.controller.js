(function() {
  'use strict';

  angular
    .module('EdoolsApp')
    .controller('StudentsController', StudentsController)
    .controller('StudentsNewController', StudentsNewController)
    .controller('StudentsEditController', StudentsEditController)

  StudentsController.$inject     = ['$scope', '$routeParams', 'StudentFactory', 'SchoolFactory']
  StudentsNewController.$inject  = ['$scope', '$routeParams', '$location', 'StudentFactory']
  StudentsEditController.$inject = ['$scope', '$routeParams', '$location', 'StudentFactory']

  function StudentsController($scope, $routeParams, StudentFactory, SchoolFactory) {
    var vm = this;
    vm.students = StudentFactory.query({ 'q[school_id_eq]': $routeParams.school_id });
    vm.school_id = $routeParams.school_id;
    vm.school = SchoolFactory.get({ id: $routeParams.school_id });
  }

  function StudentsNewController($scope, $routeParams, $location, StudentFactory) {
    var vm = this;
    vm.student = new StudentFactory;
    vm.student.school_id = $routeParams.school_id

    vm.save = function() {
      StudentFactory.save(vm.student,
				function(data) {
          $location.path('/schools/' + $routeParams.school_id + '/students');
				},
				function(error) {
					console.log(error.data);
				}
			);
    }
  }

  function StudentsEditController($scope, $routeParams, $location, StudentFactory) {
    var vm = this;
    vm.student = StudentFactory.get({ id: $routeParams.id });

    vm.save = function() {
      StudentFactory.update(vm.student,
				function(data) {
          $location.path('/schools/' + vm.student.school_id + '/students');
				},
				function(error) {
					console.log(error.data);
				}
			);
    }
  }
})();
