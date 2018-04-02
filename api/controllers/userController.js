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
    connection.query('SELECT * FROM User WHERE tokenFB = "' + tokenFB + '"', function (error, results, fields) {
        if (results.length > 0) {
            res.json({response: true});
        }
        else {
            connection.query('INSERT INTO User VALUES ("' + tokenFB + '", "' + firstName + '", "' + lastName + '")', function (error, results, fields) {
                if(error)throw error;
                if (error) {
                    res.json({response: false});
                }
                else {
                    var data = "";
                    var requestInsert = 'INSERT INTO UsersPokemon VALUES ';

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
                            requestInsert += '(NULL, "' + tokenFB + '", "' + pokemonId + '"),';
                            response.push(tmpData[pokemonId]);
                        }
                        req = requestInsert.substring(0, requestInsert.length - 1);
                        connection.query(requestInsert, function (error, results, fields) {
                            if (error) {
                                res.json({response: false});
                            } else {
                                res.json({response: true});
                            }
                        });
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
        }
        ;
    });
}