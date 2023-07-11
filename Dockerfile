# Base image
FROM php:8.1-apache

# Set working directory
WORKDIR /var/www/html

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy application files
COPY . .

# Copy the .env file specificially
COPY .env /var/www/html/.env


# Copy entrypoint script
COPY .docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port
EXPOSE 80

# Set entrypoint command
ENTRYPOINT ["/entrypoint.sh"]
