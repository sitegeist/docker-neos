FROM nginx:1.14.2-alpine

ENV PORT_NGINX 8081
ENV PROJECT_ROOT /project
ENV PHP_FPM_HOST php-fpm
ENV PHP_FPM_PORT 9000
ENV FLOW_CONTEXT Development/Docker

COPY ./vhost.conf /etc/nginx/conf.d/default.template

CMD ["sh", "-c", "envsubst '\\$PORT_NGINX \\$PROJECT_ROOT \\$PHP_FPM_HOST \\$PHP_FPM_PORT \\$FLOW_CONTEXT' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]