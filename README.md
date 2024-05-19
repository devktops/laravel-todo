<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

## system requirements
- PHP >= 8.3
- Composer >= 2.1.9
- Node.js >= 18.0.0
- NPM >= 7.24.0
- MySQL >= 8.0.27
- PHP Extensions
  - BCMath
  - Ctype
  - Fileinfo
  - JSON
  - Mbstring
  - OpenSSL
  - PDO
  - Tokenizer
  - XML
  - GD
  - Zip
  - Exif
  - MySQL
  - Redis
  - Composer
  - MySQL

## Installation
```bash
composer install
npm install
npm run build
cp .env.example .env
vim .env # edit database configuration
php artisan key:generate
php artisan migrate
php artisan db:seed
php artisan optimize
```

## Nginx Configuration
```nginx
server {
    listen 80;
    server_name laravel.thixpin.me;
    root /var/www/laravel.thixpin.me/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";

    index index.php index.html index.htm index.nginx-debian.html;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

## php-fpm Configuration
```bash
vim /etc/php/8.3/fpm/pool.d/www.conf
```

```nginx
user = www-data
group = www-data
listen = /var/run/php/php8.3-fpm.sock
listen.owner = www-data
listen.group = www-data
listen.mode = 0660
```

## Install php in Ubuntu
```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y nginx php8.3 php8.3-fpm php8.3-mysql php8.3-xml php8.3-mbstring php8.3-gd php8.3-curl php8.3-zip php8.3-imagick php8.3-redis php8.3-bcmath php8.3-exif php8.3-ctype php8.3-fileinfo php8.3-tokenizer php8.3-xml
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
sudo apt install -y mysql-server mysql-client
```

```mysql
CREATE USER 'kt'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
CREATE DATABASE laravel;
GRANT ALL PRIVILEGES ON laravel.* TO 'kt'@'localhost';
GRANT CSELECT, REFERENCES on *.* TO 'kt'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```
