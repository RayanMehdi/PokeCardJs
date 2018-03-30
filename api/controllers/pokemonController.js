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

exports.collection = function(req, res) {
    var loginUser = req.body.login; // POST
    //var loginUser = req.params.login; // GET

    connection.query('SELECT id_pokemon FROM Collection_User WHERE login_user LIKE "' + loginUser + '" ORDER BY id_pokemon', function(error, results, fields) {
        if(error){
            res.json({ response: false });
        }
        else if(results.length > 0) {

            var options = "https://pokeapi.co/api/v2/pokedex/1/"; //pokedex national

            var data = "";
            var response = [];
            var request = https.get(options, (result) => {
                result.on('data', (d) => {
                data += d;
        });
            result.on('end', function() {
                var infoPokemon = JSON.parse(data);
                for(var i=0;i<results.length;i++){
                    var pkmnTmp = {
                        "id_pokemon":results[i].id_pokemon,
                        "name_pokemon": infoPokemon.pokemon_entries[results[i].id_pokemon-1].pokemon_species.name,
                        "url_img": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+results[i].id_pokemon+".png"
                    };
                    response.push(pkmnTmp);
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


/*public function getUsersPokemon(Request $request, Application $app)
{
    $client = new Client();
    $parameters = $request->attributes->all();
    $pokemons = array();
    $urls_pokemon = $app['repository.pokemon']->getUsersPokemon($parameters['tokenFB']);
    //var_dump($urls_pokemon);die;
    foreach ($urls_pokemon as $url) {
    //var_dump($url);die;
    $res = $client->request('GET', $url);
    //  var_dump($res);die;
    $contents = $res->getBody()->getContents(); // return the json
    // var_dump($contents);die;
    $pokemon = json_decode($contents);
    // var_dump($pokemon);die;
    // var_dump($this->pokemonToArray(json_decode($pokemon)));die;
    $temp = new Pokemon(
        $pokemon->id,
        $pokemon->sprites->front_default,
        $pokemon->name,
        $pokemon->stats[5]->base_stat,
        $pokemon->stats[4]->base_stat,
        $pokemon->stats[3]->base_stat,
        $pokemon->stats[2]->base_stat,
        $pokemon->stats[1]->base_stat,
        $pokemon->stats[0]->base_stat
    );
    // var_dump($temp);die;
    array_push($pokemons, json_decode( $temp->toJson(),true));
}
    $content =json_encode($pokemons);
    return new Response($content, Response::HTTP_OK, array('content-type' => 'application/json'));
}*/


