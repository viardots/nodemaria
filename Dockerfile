FROM debian:stretch
MAINTAINER Sebastien Viardot
RUN apt-get update \
    && apt-get install -y curl mariadb-server mariadb-client \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN useradd -ms /bin/bash backdev
RUN npm install -g nodemon
# Pour bien faire, il faut exécuter la suite
# avec cet utilisateur backdev avec de moindres privilèges
USER backdev
# Pour démarrer le serveur mariadb, il faudra se connecté (une fois démarré)
# en tant que root avec la commande docker exec
WORKDIR /home/backdev
EXPOSE 3000
