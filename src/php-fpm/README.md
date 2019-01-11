# PHP-FPM Docker Image

> `docker pull sitegeist/neos-php-fpm`

Service Homepage: https://php-fpm.org/

Docker-Hub: https://hub.docker.com/r/sitegeist/neos-php-fpm

## Why PHP-FPM

PHP-FPM is a FastCGI implementation for PHP that mainly allows us to separate containers for the web server and the application server. It also manages PHP process lifecycles, so processes are not created on a per-request basis, which is faster.

## Environment variables

### FLOW_CONTEXT

**Default:** `Development/Docker`

The Neos Flow Application context.

## Usage

*Basic usage example in docker-compose.yaml:*
```yaml
version: '3.6'
services:
  # ...

  php-fpm:
    image: sitegeist/neos-php-fpm:latest
    working_dir: /project
    environment:
      - FLOW_CONTEXT=Development/Docker
      - MYSQL_HOST=mariadb
      - MYSQL_DATABASE=${CRED_MYSQL_DATABASE}
      - MYSQL_USER=${CRED_MYSQL_USER}
      - MYSQL_PASSWORD=${CRED_MYSQL_PASSWORD}

  # ...
```

As for volumes, it is recommended to mount `bin`, `Build/BuildEssentials`, `Packages`, `Data` and `Web` as anonymous volumes. All of these directories are created during the Neos CMS installation and/or first initialization of Neos and contain data, that for efficiency reasons shall be persisted in between development sessions.

Furthermore the directories `Build`, `DistributionPackages`, `Configuration` as well as the files `composer.json` and `composer.lock` shall be mounted from the host filesystem, because they contain the essential source code of a Neos CMS project.

*Example for the usage of volumes in docker-compose.yaml:*
```yaml
version: '3.6'
services:
  # ...
  php-fpm:
    # ...
    volumes:
      - bin:/project/bin:delegated
      - buildessentials:/project/Build/BuildEssentials:delegated
      - packages:/project/Packages:delegated
      - data:/project/Data:delegated
      - web:/project/Web:delegated
      - ./Build:/project/Build
      - ./DistributionPackages:/project/DistributionPackages
      - ./Configuration:/project/Configuration
      - ./composer.json:/project/composer.json
      - ./composer.lock:/project/composer.lock
  # ...
volumes:
  bin:
  buildessentials:
  packages:
  data:
  web:
```

Since this is the image for application container in a Neos CMS project, it most likely reasonable to attach Docker secrets - if provided - as well.

*Example for the usage of Docker secrets in docker-compose.yaml:*
```yaml
version: '3.6'
services:
  # ...
  php-fpm:
    # ...
    secrets:
      - my_secret
  # ...
secrets:
  my_secret:
    file: path/to/my_secret
```
