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
    var offset = req.params.offset;
    var options = "https://pokeapi.co/api/v2/pokemon/?limit=20&offset="+offset+"/";

    var data = "";
    var response ={};
    var pokemons = [];
    var urls = [];
    var pokemon =[];
    var infoPokemon;
    var requestUrls = https.get(options, (result) => {result.on('data', (d) => {data += d;});


    result.on('end', function() {
        var prev = parseInt(offset)-20;
        var next = parseInt(offset)+20;
        if(prev <= 0) {
            response.previous = "http://localhost:3000/list/" + 0 + "/";
        }else{
            response.previous = "http://localhost:3000/list/" + prev + "/";
        }
        if(next >= 930) {
            response.next = "http://localhost:3000/list/" + 930 + "/";
        }else{
            response.next = "http://localhost:3000/list/" + next + "/";
        }

        var infoUrl = JSON.parse(data);
        //console.log(infoUrl);
        for(var i=0;i<20;i++){
            var id_pkmn = i+parseInt(offset);
            //recupération du des urls ici TODO: Création model
            var urlTmp = {"url": infoUrl.results[id_pkmn]//, "icon": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+id_pkmn+".png"/*,
                /* "pv": infoPokemon.stats[0].stat.base_stats*/};

            urls.push(urlTmp);
            var requestPokemon = https.get(urls[0].url.url, (resultPokemon) => {resultPokemon.on('data', (d) => {data += d;})
            result.on('end', function() {
                    infoPokemon = JSON.parse(data);
                    console.log(infoPokemon);
                });
            });
            requestPokemon.on('error', (e) => {
                console.error(e);
        });

            requestPokemon.end();
        }
        response.urls = urls;
        res.json(response);
    });
});
    requestUrls.on('error', (e) => {
        console.error(e);
});

    requestUrls.end();

}