FROM php:7.4-apache
MAINTAINER Sayyed Ali Agha Hashimi <ali.omid730@gmail.com>
RUN apt-get update -y \
   && apt-get install -y wget rrdtool \
   && wget https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions \
   && chmod +x install-php-extensions \
   && ./install-php-extensions gd gmp ldap sockets pdo_mysql snmp gettext \
   && wget https://files.cacti.net/cacti/linux/cacti-1.2.19.tar.gz \
   && tar -xzvf cacti-1.2.19.tar.gz -C /var/www/html/ \
   && mv /var/www/html/cacti-1.2.19 /var/www/html/cacti \
   && chown -R www-data:root /var/www/html

COPY cacti/php.ini-production /usr/local/etc/php/php.ini
COPY cacti/config.php /var/www/html/cacti/include/config.php
