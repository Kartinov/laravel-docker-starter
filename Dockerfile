# 1. Start with the official PHP 8.5 Image from Docker Hub
FROM php:8.5-fpm

# 2. Install required system dependencies (like git and zip tools)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# 3. Clear out the installation cache to keep our container lightweight
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 4. Install the PHP extensions Laravel explicitly needs to talk to MySQL
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 5. Grab the latest official Composer binary from its own Docker Hub image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 6. Set the default working directory inside the container
WORKDIR /var/www