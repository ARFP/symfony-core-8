#!/bin/bash
set -e

# Si le dossier est vide (ou ne contient que le dossier 'symfony')
if [ ! -f "composer.json" ]; then
    echo "--- Installation de Symfony 7.2 (PHP 8.4) ---"
    
    # Installation de Composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    
    # Création du projet Symfony (Skeleton pour API)
    # Note: On utilise 7.2 car la 8.4 n'est pas encore sortie en version stable
    composer create-project symfony/skeleton .
    
    # Installation des composants essentiels pour une API
    composer require webapp --webapp # ou 'api' pour un projet plus léger
    
    echo "--- Nettoyage des droits ---"
    chown -R www-data:www-data /var/www/html
fi

echo "--- Démarrage d'Apache ---"
exec apache2-foreground