# MariaDB Docker Image

> `docker pull sitegeist/neos-mariadb`

Service Homepage: https://mariadb.org/

Docker Hub: https://hub.docker.com/r/sitegeist/neos-mariadb

## Why MariaDB?

As opposed to other RDBMS, like PostgreSQL, we rely on the first-class citizenship of a MySQL compliant database like MariaDB for running Neos CMS.

The relationship between MariaDB and MySQL can be described in similar terms as the relationship between Libre Office and Open Office. But besides the more liberal licensing policy, MariaDB is also a fork of MySQL that is simply faster, more secure and appears to be innovating more reliably, while staying relatively backwards-compatible (in that, it is easy to migrate from MySQL to MariaDB but not the other way round).

(For more on the topic: https://opensourceforu.com/2018/04/why-mariadb-scores-over-mysql/)

## Environment variables

### MYSQL_ROOT_PASSWORD

Password for the user `root`.

### MYSQL_DATABASE

The database name - A database with this name will be created, if it does not exist yet.

### MYSQL_USER

The username for the database user.

### MYSQL_PASSWORD

The password for the database user.

## Usage

It is recommended to expose the MariaDB port `3306` to the host system, since its required by tooling like "sequel pro".

Furthermore it is recommended to mount `/var/lib/mysql` as an anonymous volume, to persist database state in between development sessions.

*Full usage example in docker-compose.yaml:*
```yaml
version: '3.6'
services:
  # ...
  mariadb:
    image: sitegeist/neos-mariadb:latest
    environment:
      - MYSQL_ROOT_PASSWORD=${CRED_MYSQL_ROOT_PASSWORD}
      - MYSQL_DATABASE=${CRED_MYSQL_DATABASE}
      - MYSQL_USER=${CRED_MYSQL_USER}
      - MYSQL_PASSWORD=${CRED_MYSQL_PASSWORD}
    volumes:
      - database:/var/lib/mysql:delegated
    ports:
      - "${PORT_MARIADB}:3306"
  # ...
  volumes:
    database:
```