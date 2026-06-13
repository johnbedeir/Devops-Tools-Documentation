# Pull php-apache image 
FROM php:8.4.11-apache-bullseye

# use root user
USER root 

# Set working directory to the apache public directory 
WORKDIR /var/www/html

# Copy all files into the apache public directory
COPY . /var/www/html/

# Install the dependencies to run php
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    curl \
    unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*


COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

# Download php composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

# Switch to non-root user for runtime
USER www-data