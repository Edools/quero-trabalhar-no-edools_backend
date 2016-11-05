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
      .when('/schools/:school_id/students', {
  	    templateUrl: '/assets/angular/views/schools/students/index.html',
  	    controller: 'StudentsController',
        controllerAs: 'vm'
  	  })
      .when('/schools/:school_id/students/new', {
  	    templateUrl: '/assets/angular/views/schools/students/form.html',
  	    controller: 'StudentsNewController',
        controllerAs: 'vm'
  	  })
      .when('/students/:id/edit', {
  	    templateUrl: '/assets/angular/views/schools/students/form.html',
  	    controller: 'StudentsEditController',
        controllerAs: 'vm'
  	  })
      .when('/courses', {
        templateUrl: '/assets/angular/views/courses/index.html',
        controller: 'CoursesController',
        controllerAs: 'vm'
      })
      .when('/courses/new', {
  	    templateUrl: '/assets/angular/views/courses/form.html',
        controller: 'CoursesNewController',
        controllerAs: 'vm'
  	  })
      .when('/courses/:id/edit', {
  	    templateUrl: '/assets/angular/views/courses/form.html',
  	    controller: 'CoursesEditController',
        controllerAs: 'vm'
  	  })
      .otherwise({
        redirectTo: '/schools'
      })
  }
})();
