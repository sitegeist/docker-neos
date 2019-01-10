FROM nginx:1.14.2-alpine

ENV PORT_NGINX 8081
ENV PHP_FPM_HOST php-fpm
ENV PHP_FPM_PORT 9000
ENV FLOW_CONTEXT Development/Docker

COPY ./vhost.conf /etc/nginx/vhost.conf
COPY ./env.conf /etc/nginx/conf.d/default.template

CMD ["sh", "-c", "envsubst < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]