'use strict';
module.exports = function(app) {
    var pokemonController = require('../controllers/pokemonController');
    var userController = require('../controllers/userController');

    //POKEMONS ROUTES

    //Get every pokemons
    app.route('/list').get(pokemonController.list);
    //Details for 1 pokemon
    app.route('/pokemon/:idPoke').get(pokemonController.pokemon);//Details for 1 pokemon
    //Get user's pokemon List
    //app.route('/usersPokemon/:tokenFB').get(pokemonController.usersPokemon);


    //USERS ROUTES
    //Login or Signup + add few pokemons to the new user
    app.route('/login').post(userController.login);




};
