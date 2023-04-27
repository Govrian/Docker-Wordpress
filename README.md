# Projet WordPress avec Docker Compose

Ce projet met en place un environnement WordPress complet, comprenant MariaDB, PHPMyAdmin et MailDev, en utilisant Docker Compose.

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
