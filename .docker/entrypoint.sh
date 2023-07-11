#!/bin/bash
set -e

# Install dependencies
apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    unzip \

# Install dependencies using Composer
composer install --optimize-autoloader

# Change ownership of directories
chown -R www-data:www-data /var/www/html/

# Specify the path to the Apache configuration file
APACHE_CONF="/etc/apache2/sites-available/000-default.conf"

# Specify the desired document root directory
DOCUMENT_ROOT="/var/www/html/public/"

# Update the Apache configuration with the new document root
sed -i "s|DocumentRoot /var/www/html|DocumentRoot ${DOCUMENT_ROOT}|" ${APACHE_CONF}

# Enable the Apache rewrite module
a2enmod rewrite

# # Generate the Application Key
# php artisan key:generate --force

# # Set the Application Key in the .env file
# NEW_APP_KEY=$(php artisan key:generate --show)
# sed -i "s/^\(APP_KEY\s*=\s*\).*\$/\1${NEW_APP_KEY}/" .env

# # Clear the Application Cache
# php artisan cache:clear

# Start Apache in the foreground
exec apache2-foreground
