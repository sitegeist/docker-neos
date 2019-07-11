FROM php:7.2.19-fpm-alpine

COPY ./php.ini /usr/local/etc/php/php.ini

COPY ./00-aliases.sh /etc/profile.d/00-aliases.sh
COPY ./ssh_config /etc/ssh/ssh_config
COPY ./imagemagick-policy.xml /tmp/imagemagick-policy.xml

COPY ./provision.sh /provision.sh

ENV FLOW_CONTEXT Development/Docker

RUN apk --update add --no-cache bash && /provision.sh
