# Use a stable, secure base image
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install any PHP extensions if needed (e.g., mysqli)
RUN docker-php-ext-install mysqli && \
    a2enmod rewrite

# Copy source code into container
COPY . .

# Healthcheck (verify homepage loads)
HEALTHCHECK CMD curl --fail http://localhost/ || exit 1

# Expose HTTP port
EXPOSE 80

# Launch Apache in foreground
CMD ["apache2-foreground"]
