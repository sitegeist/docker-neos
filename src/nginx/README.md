# Nginx Docker Image

> `docker pull sitegeist/neos-nginx`

Service Homepage: https://www.nginx.com/
Docker Hub: https://hub.docker.com/r/sitegeist/neos-nginx

## Why Nginx?

In our Neos CMS docker setup, Nginx is the front-facing webserver that is connected via FastCGI to our PHP-FPM application server.

Nginx comes with little overhead, very easy configuration and good performance and works reliably in development scenarios. Besides that, it is also our preferred option for hosting Neos in production.

## Environment variables

### PORT_NGINX

**Default:** `8081`

The port, Nginx should listen on.

### PROJECT_ROOT

**Default:** `/project`

### PHP_FPM_HOST

**Default:** `php-fpm`

The hostname of the PHP-FPM application server (equivalent to the respective service name in docker-compose.yaml).

### PHP_FPM_PORT

**Default:** `9000`

The port of the PHP-FPM application server.

### FLOW_CONTEXT

**Default:** `Development/Docker`

The Neos Flow Application context.

## Usage

The Webserver needs access to the directories `Packages`, `Data`, `Web` and `DistributionPackages` to be able to serve static files. These should be configured as shared volumes between the web- and the application server.

The port configured under `PORT_NGINX` should be exposed to the host system.

```yaml
version: '3.6'
services:
  # ...
  webserver:
    image: sitegeist/neos-nginx:latest
    working_dir: /project
    environment:
      - PORT_NGINX=${PORT_NGINX}
      - PROJECT_ROOT=/project
      - PHP_FPM_HOST=php-fpm
      - PHP_FPM_PORT=9000
      - FLOW_CONTEXT=Development/Docker
    volumes:
      - packages:/project/Packages:delegated
      - data:/project/Data:delegated
      - web:/project/Web:delegated
      - ./DistributionPackages:/project/DistributionPackages
    ports:
      - "${PORT_NGINX}:${PORT_NGINX}"
  # ...
```