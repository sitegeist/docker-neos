FROM php:7.2.13-fpm-alpine

COPY ./php.ini /usr/local/etc/php/php.ini

COPY ./.bashrc /home/www-data/.bashrc
COPY ./ssh_config /home/www-data/.ssh/config

COPY ./provision.sh /provision.sh
RUN apk --update add --no-cache bash && /provision.sh
