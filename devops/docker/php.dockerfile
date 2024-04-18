# Use a PHP image with PHP-FPM
FROM php:8.1-fpm-alpine

# Install additional PHP extensions and dependencies
RUN apk add --no-cache \
    libzip-dev \
    zip \
    unzip \
    nodejs \
    npm \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install pcntl 

# Copy the PHP-FPM configuration file
ADD devops/docker/www.conf /usr/local/etc/php-fpm.d/www.conf


# Set the working directory
RUN mkdir -p /var/www/html && chown www-data:www-data /var/www/html
WORKDIR /var/www/html


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
