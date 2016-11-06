(function() {
  'use strict';

  angular
    .module('EdoolsApp')
    .factory('SchoolFactory', SchoolFactory)

  SchoolFactory.$inject = ['$resource']

  function SchoolFactory($resource) {
    return $resource('/schools/:id.json', { id: '@id' }, { update: { method: 'PUT' }});
  }
})();
