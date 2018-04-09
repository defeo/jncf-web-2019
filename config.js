#!/usr/bin/env node

var Metalsmith  = require('metalsmith');
var layouts     = require('metalsmith-layouts');
var markdown    = require('metalsmith-markdown');
var sass        = require('metalsmith-sass');
var dateformat  = require('dateformat');
dateformat.i18n = {
    dayNames: [
	'dim', 'lun', 'mar', 'mer', 'jeu', 'ven', 'sam',
	'dimanche', 'lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi',
    ],
    monthNames: [
        'jan.', 'fév.', 'mar.', 'avr.', 'mai', 'juin', 'juil.', 'août', 'sep.', 'oct.', 'nov.', 'déc.',
        'janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'
    ],
    timeNames: [
        'a', 'p', 'am', 'pm', 'A', 'P', 'AM', 'PM'
    ]
}

Metalsmith(__dirname)
    .metadata({
	sitename: "Journées Nationales de Calcul Formel 2019",
	siteurl: "http://www.jncf2019.uvsq.fr/",
	description: "Journées Nationales de Calcul Formel 2019 – 4-8 février 2019.",
	datestart: "2019-02-04",
	dateend: "2019-02-08",
	generatorname: "Metalsmith",
	generatorurl: "http://metalsmith.io/",
	built: new Date(),
    })
    .source('./src')
    .ignore('*~')
    .destination('./build')
    .clean(true)
    .use(sass({
	outputStyle: "expanded"
    }))
    .use(markdown())
    .use(layouts({
	engineOptions: {
	    filters: {
		"datefmt": (str, fmt) => dateformat(new Date(str), fmt),
	    }
	}
    }))
    .build(function(err) {
	if (err) throw err;
    });
