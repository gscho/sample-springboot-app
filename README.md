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

## Configuration

In this example we will apply a configuration change to a single package or a service group.

Let's update the port from 8080 (default) to 9090.

### Applying configuration to a single package

#### Method 1: Write a file to the config directory

Writing a file to the configuration directory will cause the supervisor to watch the file(s) for changes and update the package's configuration automatically.

```
mkdir -p /hab/user/sample-springboot-app/config
cat <<EOF > /hab/user/sample-springboot-app/config/user.toml
[server]
  port = 9090
EOF
```

#### Method 2: Use an environment variable

You can also configure the package through an environment variable. This has a caveat, **you must set the environment variable before running the supervisor**

```
cat <<EOF > /tmp/user.toml
[server]
  port = 9090
EOF
HAB_SAMPLE_SPRINGBOOT_APP="$(cat /tmp/user.toml)" hab run
hab svc load gscho/sample-springboot-app
```

## Applying configuration to a service group

#### Method 1: Apply a configuration update against a local supervisor

The below commands are executed directly on the server that is running the package.

```
cat <<EOF > /tmp/user.toml
[server]
  port = 9090
EOF
hab config apply sample-springboot-app.default $(date +%s) /tmp/user.toml
```

#### Method 2: Apply a configuration update against a remote supervisor

The below commands are executed directly on the workstation or build server against a remote supervisor. This requires some configuration when running a habitat supervisor for the first time.

1. You must pass the ctl-gateway argument to hab sup run
  - `hab sup run --listen-ctl=0.0.0.0:9632`
2. You must have an environment variable set on your workstation for HAB_CTL_SECRET. The CTL secret should be stored when you install the supervisor for the first time
  - `cat /hab/sup/default/CTL_SECRET`

```
export HAB_CTL_SECRET="secret-token"
cat <<EOF > /tmp/user.toml
[server]
  port = 9090
EOF
hab config apply --remote-sup=hab1.mycompany.com sample-springboot-app.default $(date +%s) /tmp/user.toml
```
