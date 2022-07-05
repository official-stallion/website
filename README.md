# K8S - Golang

Basics of implementing a **Golang** project, with **Kubernetes** deployments, using helm charts.

<p align="center"> 
	<img src="assets/logo.png" width="700" alt="logo" />
</p>

In this repository, I present every tool that you need to use
when you're going to implement a Golang service. After that, I will give an
example of how to deploy your Golang service onto a Kubernetes cluster with Helm Charts.


## Structure
### Main
Our main service is a simple HTTP server implemented in Golang. This 
service uses _Golang Echo library_ to bring up a simple HTTP server.

You can run the service with following command:
```shell
go run main.go
```

Result would be something like this:
```shell
   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.7.1
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:8080
```

Every project has a main function, this is ours.

### Workflow
A workflow is a configurable, automated process that 
will run one or more jobs. 
Workflows are defined by a YAML file checked in to your repository 
and will run when triggered by an event in your 
repository, or they can be triggered manually, 
or at a defined schedule.

Workflows are defined in the _.github/workflows_ 
directory in a repository, 
and a repository can have multiple workflows, 
each of which can perform a different set of tasks. 

For example, you can have one workflow to build 
and test pull requests, another workflow to deploy 
your application every time a release is created, 
and still another workflow that adds a label every 
time someone opens a new issue.

A simple workflow schema:
```yaml
name: Cli

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:

  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: Set up Go
      uses: actions/setup-go@v2
      with:
        go-version: 1.17

    - name: Build
      run: go build -v ./...

    - name: Test
      run: go test -v ./...
```

### Docker
Docker takes away repetitive,
mundane configuration tasks and is used throughout 
the development lifecycle for fast, easy and portable 
application development – desktop and cloud. 
Docker’s comprehensive end to end platform includes 
UIs, CLIs, APIs and security that are engineered to 
work together across the entire application delivery 
lifecycle.

When you want to release your service, for testing or even production, you need
to have an image of your application. For creating an image of your service
you need to create a dockerfile to dockerize your application.

A simple docker file for golang projects:
```dockerfile
# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:1.17-alpine as build

# Add Maintainer Info
LABEL maintainer="amirhnajafiz"

# Change to app work directory
WORKDIR /app

# Copy all of the files
COPY . .

# Building the files
RUN CGO_ENABLED=0 go build -o ./main

# Building on the scratch base image
FROM scratch

# Copy the main file from last image
COPY --from=build ./app/main ./bin/main

# port
EXPOSE 8080

# Executing the main file
ENTRYPOINT ["/bin/main"]
```

### Docker-Compose
Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

Compose works in all environments: production, staging, development, testing, as well as CI workflows. You can learn more about each case in Common Use Cases.

A simple docker-compose file:
```yaml
version: "3.9"
services:
  app:
    container_name: "gubernetes-container"
    restart: on-failure
    build:
      dockerfile: Dockerfile
      context: .
      target: dev
    ports:
      - "8080:8080"
```

### Deployments
For deployments, you can use the docker-compose to deploy your
service on Virtual Machines.

```shell
docker-compose up -d
```

But if you want to deploy the project on cloud, you need to have a 
kubernetes cluster.

For deploying on Kubernetes cluster, I recommend to use Helm Chart.
Helm helps you manage Kubernetes applications — Helm Charts help you define, install, and upgrade even the most complex Kubernetes application.

If you want to deploy a project with helm, you need to create your charts
with following commands:
```shell
helm create deployments
```

Now you get something like this:
```
|_deployments/
    |_templates/
    |_.helmignore
    |_Chart.yaml
    |_values.yaml
```

All you need is to modify the chart and values file and deploy with following command:
```shell
helm install release-name ./deployments
```

### Makefile
For golang projects, it's good to have a Makefile, so you
don't have to write big commands every time you want to do something.

A simple makefile:
```makefile
# run
run:
	go run main.go
# build
build:
	go build -o /main
# docker compose
docker-compose:
	docker compose up -d
# docker build
docker-build:
	docker build . -t amirhossein21/gubernetes
# docker push:
docker-push:
	docker push amirhossein21/gubernetes
# deploy
up:
	helm install gubernetes ./deployments
# redo deployments
down:
	helm uninstall gubernetes
```

And for using our Make commands:
```
make run
make build
...
```
