(function() {
  'use strict';

  angular
    .module('EdoolsApp')
    .factory('CourseFactory', CourseFactory)

  CourseFactory.$inject = ['$resource']

  function CourseFactory($resource) {
    return $resource('/courses/:id.json', { id: '@id' }, { update: { method: 'PUT' }});
  }
})();
