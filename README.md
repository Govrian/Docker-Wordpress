# Projet WordPress avec Docker Compose

### Consigne du projet :

- Un docker-compose qui a au moins 2 services qui communiquent  
- Une image Docker customisé qui vient de votre compte Docker Hub (ou tous mais au moins un)  
- L'image contient un entrypoint custom  
- Au moins un volume partagé avec la machine hôte pour pouvoir garder un état si on éteint et redémarre le docker-compose  
- Des variables d'environnement pris en compte dans le container (dans le entrypoint ou par example pour connecter le back à la base de données)  
  

Ce projet met en place un environnement WordPress complet, comprenant MariaDB, PHPMyAdmin et MailDev, en utilisant Docker Compose.  
Mais aussi l'utilisation d'un Dokcerfile avec un entrypoint basé sur une image personnalisé depuis mon compte DokcherHub.

## Conteneurs et configuration

Le fichier `docker-compose.yml` définit les conteneurs et les configurations suivantes :

1. **MariaDB** (`wp_mariadb`) : base de données MariaDB pour stocker les données de WordPress.
2. **WordPress** (`wp_wordpress`) : serveur web WordPress pour héberger le site.
3. **PHPMyAdmin** (`wp_phpmyadmin`) : interface de gestion de base de données pour MariaDB.
4. **MailDev** (`wp_maildev`) : serveur de messagerie pour les tests de développement.

## Configuration des conteneurs
Dans ce projet, trois conteneurs principaux sont configurés pour interagir ensemble :

**Conteneur WordPress** : Le conteneur est nommé "wordpress" et est construit à partir de l'image "wordpress". Il est lié à la base de données "db" et expose le port 80 de la machine hôte sur le port 8081. Un volume est également copié pour persister les données.

**Conteneur MariaDB** : Le conteneur est nommé "wpmariadb" et est construit à partir de l'image "mariadb". Il initialise une variable d'environnement "MYSQL_ROOT_PASSWORD" avec la valeur "root" et expose le port 3306 de la machine hôte sur le port 3306 du conteneur.

**Conteneur PHPMyAdmin** : Le conteneur est nommé "wpphpmyadmin" et est construit à partir de l'image "phpmyadmin/phpmyadmin". Il est lié à la base de données "db" et initialise deux variables d'environnement "MYSQL_USERNAME" et "MYSQL_ROOT_PASSWORD" avec les valeurs "root". Le port 80 du conteneur est exposé sur le port 8080 de la machine hôte et un volume "/sessions" est créé pour persister les données de session.

## Utilisation

Pour démarrer l'environnement, assurez-vous d'avoir installé Docker et Docker Compose, puis exécutez la commande suivante à partir du répertoire contenant le fichier `docker-compose.yml` :

```bash
docker-compose up -d
```

Pour arrêter et supprimer les conteneurs, les volumes et les réseaux, exécutez la commande suivante à partir du répertoire contenant le fichier docker-compose.yml :

```bash
docker-compose down
```

## Personnalisationb avec des images Dockerfile


Pour utiliser ce docker-compose.yml,il n'y besoin de créer de Dockerfiles supplémentaires, car nous utilisons des images officielles de Docker Hub pour les services. Cependant, voici l'arborescence que vous devez avoir pour ce projet si vous voulez mettre vos propre images :

projet/  
│  
├─ docker-compose.yml  
│  
├─ wordpress/  
│   ├─ Dockerfile  
│   └─ wp-content/ (répertoire contenant vos thèmes et plugins pour WordPress)  
│  
├─ phpmyadmin/  
│   └─ Dockerfile  
│  
└─ maildev/  
    └─ Dockerfile  


Par exemple, si vous souhaitez personnaliser l'image WordPress, vous pouvez créer un fichier Dockerfile dans un dossier nommé custom-wordpress:
```
custom-wordpress/Dockerfile  

Utilisez l'image de base wordpress:latest  
FROM wordpress:latest  
  
Ajoutez ici les commandes pour personnaliser l'image, par exemple :  
COPY, ADD, RUN, etc.  
```

Après avoir créé le Dockerfile, construisez l'image personnalisée en utilisant la commande docker build. Assurez-vous de remplacer mon_identifiant_dockerhub par votre nom d'utilisateur Docker Hub et mon_tag par le tag que vous souhaitez attribuer à l'image (par exemple, "latest" ou "v1.0"):

```
docker build -t mon_identifiant_dockerhub/custom-wordpress:mon_tag custom-wordpress/
```

Ensuite, mettez à jour votre fichier docker-compose.yml pour utiliser cette image personnalisée :

```
# ...  
services:  
  # ...  
  wordpress:  
    depends_on:  
      - db  
    image: mon_identifiant_dockerhub/custom-wordpress:mon_tag  
    # ...  
```

https://hub.docker.com/u/govrian


Comme demandé j'ai créer un Dockerfile avec comme image "govrian/101-todo-app" qui est sur mon compte Dockerhub lié a un entrypoint.sh qui permet de d'indiquer l'heure.  

```
docker build -t <nom> .
```
Puis pour tester :  

```
docker run <nom> time  
> Thu Feb 18 14:27:47 UTC 2021  
```

## Entrypoint

J'ai ajouté un exemple d'entrypoint pour le service Wordpress. L'entrypoint sera utilisé pour exécuter un script personnalisé lors du démarrage du conteneur. Dans cet exemple, j'ai ajouté un script shell appelé "entrypoint.sh" qui sera exécuté au démarrage du conteneur Wordpress.  
  
Pour implémenter cet exemple, créez un fichier entrypoint.sh à la racine de votre projet et assurez-vous qu'il est exécutable (chmod +x entrypoint.sh). Le contenu du fichier doit être adapté en fonction de vos besoins.  

Cette configuration ajoutera l'entrypoint au service Wordpress, qui exécutera le script shell entrypoint.sh au démarrage du conteneur.
