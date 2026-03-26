FROM php:8.4-apache

# Extensions PHP
RUN apt-get update && apt-get install -y \
    libicu-dev libzip-dev zip git unzip \
    && docker-php-ext-install intl opcache pdo pdo_mysql zip

RUN a2enmod rewrite

# Installation de Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Copie de la config Apache et du script
COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Droits d'exécution sur le script
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /var/www/html

# On utilise le script comme point d'entrée
ENTRYPOINT ["docker-entrypoint.sh"]