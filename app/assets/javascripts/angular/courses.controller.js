(function() {
  'use strict';

  angular
    .module('EdoolsApp')
    .controller('CoursesController', CoursesController)
    .controller('CoursesNewController', CoursesNewController)
    .controller('CoursesEditController', CoursesEditController)

  CoursesController.$inject     = ['$scope', 'CourseFactory', 'SchoolFactory']
  CoursesNewController.$inject  = ['$scope', '$routeParams', '$location', 'CourseFactory', 'SchoolFactory']
  CoursesEditController.$inject = ['$scope', '$routeParams', '$location', 'CourseFactory', 'SchoolFactory']

  function CoursesController($scope, CourseFactory, SchoolFactory) {
    var vm = this;
    vm.courses = CourseFactory.query();
    vm.schools = SchoolFactory.query();

    vm.q = {};

    $scope.$watchCollection('vm.q', function(current, original) {
      console.log('teste');
      if (vm.q.title != undefined) {
        vm.courses = CourseFactory.query({ 'q[title_cont]': current.title, 'q[school_id_eq]': current.school_id });
      }
    });
  }

  function CoursesNewController($scope, $routeParams, $location, CourseFactory, SchoolFactory) {
    var vm = this;
    vm.course = new CourseFactory;
    vm.schools = SchoolFactory.query();

    vm.save = function() {
      CourseFactory.save(vm.course,
				function(data) {
          $location.path('/courses');
				},
				function(error) {
					console.log(error.data);
				}
			);
    }
  }

  function CoursesEditController($scope, $routeParams, $location, CourseFactory, SchoolFactory) {
    var vm = this;
    vm.course = CourseFactory.get({ id: $routeParams.id });
    vm.schools = SchoolFactory.query();

    vm.save = function() {
      CourseFactory.update(vm.course,
				function(data) {
          $location.path('/courses');
				},
				function(error) {
					console.log(error.data);
				}
			);
    }
  }
})();
