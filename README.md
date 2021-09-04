# Docker-php-apache-mysql
- Docker
- php:7.4-apache
- Composer 2.1.6
- Mysql 5.7

https://github.com/docker-library/php/issues/61

ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y --fix-missing \
    apt-utils \
    gnupg

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN curl -sS --insecure https://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev
RUN docker-php-ext-install zip