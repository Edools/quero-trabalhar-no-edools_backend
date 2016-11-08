const Path = require('path');

const routes = [{
    method: 'GET',
    path: '/',
    handler: function(request, reply) {
        reply('Hello, world!');
    }
}, {
    method: 'GET',
    path: '/escolas',
    handler: function(request, reply) {
        reply.view('schools/index');
    }
}, {
    method: 'GET',
    path: '/escolas/{id}',
    handler: function(request, reply) {
        reply.view('schools/show');
    }
}, {
    method: 'GET',
    path: '/escolas/{id}/cursos',
    handler: function(request, reply) {
        reply.view('schools/courses/index');
    }
}, {
    method: 'GET',
    path: '/busca',
    handler: function(request, reply) {
        var params = request.query;
        reply.view('search/index', {
            query: params.q
        });
    }
}];

module.exports = routes;
