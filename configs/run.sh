#!/bin/bash
cd /var/www/html/
echo "Install Laravel's dependencies:"
composer install 
echo "Copy .env.example to .env:"
cp .env.example .env
echo "Install Laravel's keys:"
php artisan key:generate
echo "Set the file permissions in Laravel:"
sudo chgrp -R www-data storage bootstrap/cache 
echo "Set the file permissions in Laravel:"
sudo chmod -R ug+rwx storage bootstrap/cache
echo "installation completed."
apache2-foreground
