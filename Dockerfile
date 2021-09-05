FROM php:7.3-apache

WORKDIR /var/www/html

RUN apt-get update 

RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    nano \
    cron \
    zlib1g-dev \
    libzip-dev \
    unzip \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++ \
    iputils-ping

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.1.6

RUN docker-php-ext-install \
    bz2 \
    intl \
    iconv \
    bcmath \
    opcache \
    calendar \
    mbstring \
    pdo_mysql \
    zip \
    mysqli \
    gd \
    gettext 

RUN apt-get update && apt-get install -y libc-client-dev libkrb5-dev && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

#COPY configs/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

COPY configs/cron/crontab /etc/cron.d/cool-task

RUN chmod 0644 /etc/cron.d/cool-task

RUN service cron start

# COPY configs/run.sh /var/www/html/run.sh

# COPY configs/testete.txt /var/www/html/testete.txt

# RUN sh /var/www/html/run.sh