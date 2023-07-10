#!/bin/bash
set -e

# Install dependencies
apt-get update && apt-get install -y \
    libonig-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install pdo_mysql mbstring zip

# Install dependencies using Composer
RUN composer install --optimize-autoloader

# Set up Apache configuration
a2enmod rewrite

# Change ownership of directories
chown -R www-data:www-data /var/www/html/

# Specify the path to the Apache configuration file
APACHE_CONF="/etc/apache2/sites-available/000-default.conf"

# Specify the desired document root directory
DOCUMENT_ROOT="/var/www/html/public"

# Update the Apache configuration with the new document root
sed -i "s|DocumentRoot /var/www/html|DocumentRoot ${DOCUMENT_ROOT}|" ${APACHE_CONF}

# Enable the Apache rewrite module
a2enmod rewrite

# Start Apache in the foreground
exec apache2-foreground
