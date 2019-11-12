FROM debian:stretch
MAINTAINER Sebastien Viardot
RUN apt-get update \
    && apt-get install -y curl mariadb-server mariadb-client \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN useradd -ms /bin/bash backdev
RUN npm install -g nodemon
# Pour bien faire, il faudrait exécuter la suite
# avec cet utilisateur backdev avec de moindres privilèges
# Pour simplifier les manips, le login utilisé sera celui de root
# Pour notamment démarrer le service mysqld
# USER backdev
# Par contre on travaillera dans son répertoire.
WORKDIR /home/backdev
EXPOSE 3000
