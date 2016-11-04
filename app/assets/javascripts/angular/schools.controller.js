(function() {
  'use strict';

  angular
    .module('EdoolsApp')
    .controller('SchoolsController', SchoolsController)
    .controller('SchoolsNewController', SchoolsNewController)
    .controller('SchoolsEditController', SchoolsEditController)

  SchoolsController.$inject     = ['$scope', 'SchoolFactory']
  SchoolsNewController.$inject  = ['$scope', '$routeParams', '$location', 'SchoolFactory']
  SchoolsEditController.$inject = ['$scope', '$routeParams', '$location', 'SchoolFactory']

  function SchoolsController($scope, SchoolFactory) {
    var vm = this;
    vm.schools = SchoolFactory.query();

    $scope.$watch('vm.q', function(current, original) {
      if (vm.q != undefined) {
        vm.schools = SchoolFactory.query({'q[name_cont]': current});
      }
    });
  }

  function SchoolsNewController($scope, $routeParams, $location, SchoolFactory) {
    var vm = this;
    vm.school = new SchoolFactory;

    vm.save = function() {
      SchoolFactory.save(vm.school,
				function(data) {
          $location.path('/schools');
				},
				function(error) {
					console.log(error.data);
				}
			);
    }
  }

  function SchoolsEditController($scope, $routeParams, $location, SchoolFactory) {
    var vm = this;
    vm.school = SchoolFactory.get({ id: $routeParams.id });

    vm.save = function() {
      SchoolFactory.update(vm.school,
				function(data) {
          $location.path('/schools');
				},
				function(error) {
					console.log(error.data);
				}
			);
    }
  }
})();
