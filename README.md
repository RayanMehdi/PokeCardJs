# PokeCardJs

Installation
----------

- Installez Node JS (https://nodejs.org/en) sur votre poste

- Installez Xamp (https://www.apachefriends.org/fr/index.html) puis démarrer votre base de données MySQL

- Clonez le projet

- Dans Xamp, créez une nouvelle Base de donnée appelée PokeCard et exécutez le script SQL contenu dans le dossier BDD afin de créer les tables.

- Ouvrez un terminal

- Allez dans le dossier que vous venez de cloner

- Lancez la commande "npm install" pour installer les modules Node JS (un dossier node_modules devrait apparaître dans votre projet)

- Lancez la commande "npm run start" pour démarrer le serveur

- L'adresse pour utiliser votre webservice est localhost:3000

- Installez l'apk se trouvant au l'adresse suivante sur votre téléphone Android: https://github.com/RayanMehdi/PokeCard/releases

- Connectez le téléphone Android sur lequel est installé l'application au même réseau que le machine qui fait tourner le webservice

- Contactez nous par mail avec votre identifiant facebook afin d'être ajouté a la liste des testeur de l'appilcation

Documentation Technique
-

La structure de base du projet a été conçu en suivant le guide suivant : https://www.codementor.io/olatundegaruba/nodejs-restful-apis-in-10-minutes-q0sgsfhbd.

Nous avons fait le choix de ne pas utiliser de classes model car au fur et a mesure de l'avancement du projet, nous ne nous en servions pas.

Nous utilisons donc seulement un fichier de routes ainsi que 2 controllers pour les 2 principales entités du projet: Les Pokemons et les Users.

En ce qui concerne la base de donnée, nous avons choisit de fonctionner avec MySql car il s'agit du SGBD que nous maitrisons le mieux.

Cette dernière est composée de 3 tables: 

- User qui contient le token facebook de l'utilisateur ainsi que son nom et prénom
- UsersPokemon qui sert à associé les pokemons et leurs utilisateurs
- Exchages qui n'est pas encore utilisé et qui permet de stocké les informations relatives aux echanges de pokémons entre les utilisateurs


Documentation Fonctionnelle
-

Les Routes
--

- app.route('/list').get(pokemonController.list) : Cette route permet d'obtenir le nom, l'icône ainsi que l'id de tout les pokemons du Pokedex

- app.route('/pokemon/:idPoke').get(pokemonController.pokemon) : Cette route permet d'obtenir les details du pokemon passé en paramètre : nom, icone, id ainsi que ses stats en pv, attaque, défense, attaque spéciale, défense spéciale et vitesse.

- app.route('/login').post(userController.login) : L'utilisateur lance l'application et clique sue le bouton connexion facebook. Le token facebook de l'utilisateur est donc envoyé au webservice et la 2 cas possible :
  Soit l'utilisateur existe déja dans la base de donnée auquel cas le server reponds comme un login, soit l'utilisateur n'existe pas et la route se comporte comme une inscription : L'utilisateur est ajouté à la base de donnée et 6 pokemon de base choisit aléatoirement sont ajouté à sa liste de pokemon.
  
 - app.route('/usersPokemon/:tokenFB').get(userController.usersPokemon) : Une requête est faite dans la base de donnée à l'aide du token facebook fournit en paramètre pour récupérer la liste des pokemons lié à cet utilisateur.
 
 Evolution Possible
-

Nous souhaitions ajouter la gestion des Echanges de la manière suivante:

Une première route de type GET sans paramètre permettant de recupérer dans la base de donnée la liste des Echanges (Id de l'utilisateur souhaitant un echange, ID du pokemon a offrir, ID du pokemon souhaité en retour). 

Une seconde requête de type POST prenant en paramètre un id d'utilisateur et l'id de 2 pokemons afin d'ajouté un Echange dans la base de donnée.

Enfin une dernière route de type POST prenant en paramète un ID d'échange ainsi qu'un ID d'utilisateur qui permettrait de procéder à l'échange.
