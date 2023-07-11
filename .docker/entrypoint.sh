#!/bin/bash
set -e

# Install dependencies
apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    unzip \
    npm

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

# Install node packages
npm install

# compile
npm run dev

# Start Apache in the foreground
exec apache2-foreground

