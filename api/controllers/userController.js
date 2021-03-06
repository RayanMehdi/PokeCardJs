'use strict';
var http = require('http');
var https = require('https');
var mysql = require('mysql');

var connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'PokeCard'
});

exports.login = function (req, res) {
    var tokenFB = req.body.tokenFB;
    var firstName = req.body.firstName;
    var lastName = req.body.lastName;
    console.log(tokenFB);
    connection.query('SELECT * FROM User WHERE tokenFB = "' + tokenFB + '"', function (error, results, fields) {
        if (results.length > 0) {
            res.json({response: true});
        }
        else {
            connection.query('INSERT INTO User VALUES ("' + tokenFB + '", "' + firstName + '", "' + lastName + '")', function (error, results, fields) {
                if (error) {
                    res.json({response: false});
                }
                else {
                    var data = "";
                    ;
                    var options = {
                        port: 3000,
                        hostname: '127.0.0.1',
                        method: 'GET',
                        path: '/list',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    };
                    var response = [];
                    var requestInsert='';
                    var request = http.get(options, (result) => {
                        result.on('data', (d) => {
                        data += d;
                })
                    ;
                    result.on('end', function () {
                        var tmp = JSON.parse(data);
                        for (var i = 0; i < 6; i++) {
                            var min = Math.ceil(1);
                            var max = Math.floor(950);
                            var pokemonId = Math.floor(Math.random() * (max - min + 1)) + min;
                            requestInsert = 'INSERT INTO UsersPokemon(pokemonID, tokenFB) VALUES (' + pokemonId + ', "' + tokenFB + '")';
                            response.push(tmp[pokemonId]);
                            connection.query(requestInsert, function (error, results, fields) {
                                if (error) {
                                    console.error(error);
                                    res.json({response: false});
                                }
                            });
                        }

                    });
                    request.on('error', (e) => {
                        console.error(e);
                })
                    ;
                    request.end();
                })
                    ;
                }
                ;
            });
            res.json({response: true});
        }
        ;
    });

}

exports.usersPokemon = function(req, res) {

    var tokenFB = req.params.tokenFB;

    connection.query('SELECT pokemonId FROM UsersPokemon WHERE tokenFB LIKE "' + tokenFB + '" ORDER BY pokemonId', function(error, results, fields) {
        if(error){
            res.json({ response: false });
        }
        else if(results.length > 0) {

            var options = "https://pokeapi.co/api/v2/pokemon/?limit=1000&offset=0"; //Access to every Pokemons

            var data = "";
            var response = [];
            var request = https.get(options, (result) => {
                result.on('data', (d) => {
                data += d;
        });
            result.on('end', function() {
                var infoPokemon = JSON.parse(data);
                for(var i=0;i<results.length;i++){

                    var tmp = {"idPoke":results[i].pokemonId,
                        "name": infoPokemon.results[results[i].pokemonId - 1].name,
                        "icon": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+results[i].pokemonId+".png"};
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
        else {
            res.json([]);
        }
    });
};