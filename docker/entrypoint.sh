#!/bin/sh

cd /app

echo "Setting correct permissions..."
chown -R www-data:www-data storage bootstrap/cache
chmod -R ug+rw storage bootstrap/cache

echo "Running Laravel optimizations..."
php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

echo "Starting FrankenPHP (Caddy)..."
cd /app/docker
exec frankenphp run --config /app/docker/Caddyfile