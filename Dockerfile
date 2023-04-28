# Utiliser l'image alpine:latest comme base
FROM govrian/101-todo-app:latest

# Installer les paquets nécessaires
RUN apk add --no-cache coreutils

# Ajouter le script entrypoint.sh au conteneur
COPY entrypoint.sh /entrypoint.sh

# Rendre le script exécutable
RUN chmod +x /entrypoint.sh

# Définir le script entrypoint.sh comme point d'entrée
ENTRYPOINT ["/entrypoint.sh"]
