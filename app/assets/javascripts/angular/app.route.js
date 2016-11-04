(function() {
  'use strict';

  angular
    .module('EdoolsApp')
    .config(config)

  function config($routeProvider) {
    $routeProvider
      .when('/schools', {
        templateUrl: '/assets/angular/views/schools/index.html',
        controller: 'SchoolsController',
        controllerAs: 'vm'
      })
      .when('/schools/new', {
  	    templateUrl: '/assets/angular/views/schools/form.html',
        controller: 'SchoolsNewController',
        controllerAs: 'vm'
  	  })
      .when('/schools/:id/edit', {
  	    templateUrl: '/assets/angular/views/schools/form.html',
  	    controller: 'SchoolsEditController',
        controllerAs: 'vm'
  	  })
      .otherwise({
        redirectTo: '/schools'
      })
  }
})();
