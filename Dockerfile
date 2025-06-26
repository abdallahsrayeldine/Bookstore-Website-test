# Use a stable, secure base image
FROM public.ecr.aws/docker/library/php:8.1.32-apache

# Set working directory
WORKDIR /var/www/html

# Install any PHP extensions if needed (e.g., mysqli)
RUN docker-php-ext-install pdo pdo_mysql mysqli && \
    a2enmod rewrite

# Copy source code into container
COPY . .

# Healthcheck (verify homepage loads)
HEALTHCHECK CMD curl --fail http://localhost/ || exit 1

# Expose HTTP port
EXPOSE 80

# Launch Apache in foreground
CMD ["apache2-foreground"]
