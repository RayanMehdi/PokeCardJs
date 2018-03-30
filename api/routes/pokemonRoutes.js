'use strict';
module.exports = function(app) {
    var pokemonController = require('../controllers/pokemonController');


    //Get every pokemons
    app.route('/list').get(pokemonController.list);
    //Details for 1 pokemon
    app.route('/pokemon/:idPoke').get(pokemonController.pokemon);//Details for 1 pokemon
    //Get user's pokemon List
};
