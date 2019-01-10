FROM php:7.2.13-fpm-alpine

COPY ./.bashrc /home/www-data/.bashrc
COPY ./provision.sh /provision.sh
RUN apk --update add --no-cache bash && /provision.sh
