# Projet WordPress avec Docker Compose

Ce projet met en place un environnement WordPress complet, comprenant MariaDB, PHPMyAdmin et MailDev, en utilisant Docker Compose.

## Conteneurs et configuration

Le fichier `docker-compose.yml` définit les conteneurs et les configurations suivantes :

1. **MariaDB** (`wp_mariadb`) : base de données MariaDB pour stocker les données de WordPress.
2. **WordPress** (`wp_wordpress`) : serveur web WordPress pour héberger le site.
3. **PHPMyAdmin** (`wp_phpmyadmin`) : interface de gestion de base de données pour MariaDB.
4. **MailDev** (`wp_maildev`) : serveur de messagerie pour les tests de développement.

## Utilisation

Pour démarrer l'environnement, assurez-vous d'avoir installé Docker et Docker Compose, puis exécutez la commande suivante à partir du répertoire contenant le fichier `docker-compose.yml` :

```bash
docker-compose up -d
