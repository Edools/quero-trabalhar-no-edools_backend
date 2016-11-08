{
    "restartable": "rs",
    "ignore": [
        ".git",
        "node_modules/**/node_modules",
        "public/assets/bower_components"
    ],
    "verbose": true,
    "events": {
        "restart": "osascript -e 'display notification \"App restarted due to:\n'$FILENAME'\" with title \"nodemon\"'"
    },
    "watch": [
        "public/",
        "routes/",
        "templates/",
        "index.js",
        "gulpfile.js"
    ],
    "ext": "js json hbs handlebars html"
}
