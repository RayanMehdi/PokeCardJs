'use strict';
var http = require('http');
var https = require('https');
var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'PokeCard'
});

exports.list = function(req, res) {

    var options = "https://pokeapi.co/api/v2/pokemon/?limit=1000&offset=0"; //Access to every Pokemons

    var data = "";
    var response = [];
    var request = https.get(options, (result) => {
        result.on('data', (d) => {
        data += d;
});
    result.on('end', function() {
        var infoPokemon = JSON.parse(data);
        for(var i=0;i<infoPokemon.count;i++){
            var id = i+1;
            var tmp = {"idPoke":id, "name": infoPokemon.results[i].name, "icon": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+id+".png"};
            response.push(tmp);
        }
        res.json(response);
    });
});
    request.on('error', (e) => {
        console.error(e);
});

    request.end();
}

exports.pokemon = function(req, res) {
    var idPoke = req.params.idPoke;
    var options = "https://pokeapi.co/api/v2/pokemon/"+idPoke+"/";
    var data = "";
    var response = [];
    var request = https.get(options, (result) => {
        result.on('data', (d) => {
        data += d;
});
    result.on('end', function() {
        var infosPokemon = JSON.parse(data);
        var customInfo = {
            "idPoke" : infosPokemon.id,
            "name" : infosPokemon.name,
            "icon" : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+infosPokemon.id+".png",
            "pv": infosPokemon.stats[5].base_stat,
            "att": infosPokemon.stats[4].base_stat,
            "def": infosPokemon.stats[3].base_stat,
            "spA": infosPokemon.stats[2].base_stat,
            "spD": infosPokemon.stats[1].base_stat,
            "spe": infosPokemon.stats[0].base_stat
        };
        res.json(customInfo);
    });
});
    request.on('error', (e) => {
        console.error(e);
});
    request.end();
}



