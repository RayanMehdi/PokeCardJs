'use strict';
module.exports = function(app) {
    var pokemonController = require('../controllers/pokemonController');

    app.route('/list/:offset').get(pokemonController.list);//affichage du pokedex
};
