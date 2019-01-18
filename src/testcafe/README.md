# TestCafé Docker Image

> `docker pull sitegeist/neos-testcafe`

Service Homepage: https://testcafe.devexpress.com/

Docker-Hub: https://hub.docker.com/r/sitegeist/neos-testcafe

## Why TestCafé

TestCafé is an excellent zero-config End-to-end (E2E) browser testing solution, that also power E2E tests for the Neos User Interface (e.g. https://github.com/neos/neos-ui/blob/master/Tests/IntegrationTests/contentModule.js).

It also comes with support with all major browsers and also has an adaptor for BrowserStack (https://github.com/DevExpress/TestCafe-BrowserStack).

## Environment variables

-

## Usage

*Basic usage example in docker-compose.yaml:*
```yaml
version: '3.6'
services:
  # ...

  testcafe:
    image: sitegeist/neos-testcafe:latest
    entrypoint: tail -f /dev/null
    environment:
      - TEST_DOMAIN=webserver:${PORT_NGINX}

  # ...
```