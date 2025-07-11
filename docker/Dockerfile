# -------- STAGE 1: Builder --------
FROM dunglas/frankenphp:php8.2 AS builder

WORKDIR /app

# Install system dependencies for building PHP extensions
RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    libzip-dev \
    libpq-dev \
    default-mysql-client \
    libxml2-dev \
    libonig-dev \
    libicu-dev \
 && rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) iconv sockets pdo pdo_mysql opcache gd zip pgsql pdo_pgsql

# Salin custom config
COPY docker/custom-php.ini /usr/local/etc/php/conf.d/99-custom.ini

# Copy Laravel app
COPY src/ /app/

# Copy Caddyfile and Entrypoint
COPY docker/Caddyfile /app/docker/Caddyfile
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install dependencies
RUN composer install --no-dev --optimize-autoloader 

# -------- STAGE 2: Runtime --------
FROM dunglas/frankenphp:php8.2

WORKDIR /app

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libpng16-16 \
    libjpeg62-turbo \
    libfreetype6 \
    libzip4 \
    libpq5 \
    libonig5 \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app /app
COPY --from=builder /usr/local/lib/php/extensions /usr/local/lib/php/extensions
COPY --from=builder /usr/local/etc/php /usr/local/etc/php

COPY --from=builder /entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443

CMD ["/entrypoint.sh"]