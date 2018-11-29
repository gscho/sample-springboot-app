# sample-springboot-app

This is a simple habitat package for a spring boot application.

## Instructions

To run this using habitat you'll first need to [install habitat for your OS](https://www.habitat.sh/docs/install-habitat/).

From the root directory of this repository run the following:

Mac OS & Windows

```bash
HAB_DOCKER_OPTS="-p 8080:8080" hab studio enter
build
hab svc load gscho/sample-springboot-app

```

Linux

```bash
hab studio enter
build
hab svc load gscho/sample-springboot-app

```

This will load the app. To test it out there are two endpoints:

- `http://localhost:8080/greeting`
- `http://localhost:8080/actuator/health`
