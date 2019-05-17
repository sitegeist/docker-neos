FROM php:7.2.13-fpm-alpine

COPY ./php.ini /usr/local/etc/php/php.ini

COPY ./.bashrc /home/www-data/.bashrc
COPY ./ssh_config /etc/ssh/ssh_config

COPY ./provision.sh /provision.sh

ENV FLOW_CONTEXT Development/Docker

RUN apk --update add --no-cache bash && /provision.sh
