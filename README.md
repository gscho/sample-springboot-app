# spring-boot-habitat

This is a simple habitat package for the spring boot tutorial app `gs-rest-service` found [here](https://spring.io/guides/gs/rest-service/).

## Instructions

To run this using habitat you'll first need to [install habitat for your OS](https://www.habitat.sh/docs/install-habitat/).

From the root directory of this repository run the following:

Mac OS

```bash
HAB_DOCKER_OPTS="-p 8080:8080" hab studio enter
build
hab svc load gscho/gs-rest-service

```

Linux

```bash
hab studio enter
build
hab svc load gscho/gs-rest-service

```

This will load the app. To test it out there are two endpoints:

- `http://localhost:8080/greetings`
- `http://localhost:8080/actuator/health`
