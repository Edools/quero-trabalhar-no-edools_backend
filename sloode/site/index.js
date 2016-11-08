'use strict';

require('dotenv').config();

const Path = require('path');
const Hapi = require('hapi');
const Hoek = require('hoek');
const Vision = require('vision');
const Inert = require('inert');
const Handlebars = require('handlebars');
const extend = require('handlebars-extend-block');

const server = new Hapi.Server();

server.register([Vision, Inert], (err) => {

    Hoek.assert(!err, err);

    const defaultContext = {
        baseAPIURL: process.env.API_HOST
    };

    server.views({
        engines: {
            hbs: extend(Handlebars),
        },
        relativeTo: __dirname,
        layoutPath: './templates/layout',
        layout: 'base',
        path: './templates',
        partialsPath: __dirname + '/templates/partials',
        helpersPath: __dirname + '/templates/helpers',
        context: defaultContext
    });
});

server.connection({
    port: process.env.APP_PORT
});

/**
 * Routes
 */
server.route(require('./routes'));

/**
 * Serving static files
 */
server.route({
    method: 'GET',
    path: '/{filename*}',
    handler: {
        directory: {
            path: Path.join(__dirname, 'public'),
            listing: false,
            index: false
        }
    }
});

/**
 * Start the app
 */
server.start((err) => {

    if (err) {
        throw err;
    }
    console.log(`Server running at: ${server.info.uri}`);
});
