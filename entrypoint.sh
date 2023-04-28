#!/bin/sh

# Vérifier si la commande 'time' est passée en argument
if [ "$1" = "time" ]; then
  # Afficher l'heure actuelle
  date
else
  # Exécuter la commande passée en argument
  exec "$@"
fi
