#!/bin/bash
echo "Install Laravel's dependencies:"
php /usr/local/bin/composer install 
echo "Copy .env.example to .env:"
cp .env.example .env
echo "Install Laravel's keys:"
php artisan key:generate
echo "Set the file permissions in Laravel:"
sudo chgrp -R www-data storage bootstrap/cache 
echo "Set the file permissions in Laravel:"
sudo chmod -R ug+rwx storage bootstrap/cache
echo "installation completed."