#!/bin/sh
set -e

# Exemple de commande à exécuter avant le démarrage du serveur Apache
echo "Exécution d'une commande personnalisée avant le démarrage d'Apache..."

# Démarrage du serveur Apache en arrière-plan
apache2-foreground &
pid="$!"

# Attente de l'arrêt du serveur Apache
wait "$pid"
