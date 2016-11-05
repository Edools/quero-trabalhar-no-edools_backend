(function() {
  'use strict';

  angular
    .module('EdoolsApp')
    .factory('StudentFactory', StudentFactory)

  StudentFactory.$inject = ['$resource']

  function StudentFactory($resource) {
    return $resource('/students/:id.json', { id: '@id' }, { update: { method: 'PUT' }});
  }
})();
