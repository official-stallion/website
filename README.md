# Gubernetes

Basics of a Golang project, with Kubernetes deployment.

In this repository, I present every tool that you need to use
when you're going to implement a Golang service.

We are going to explain the structure and the usage of each
part.

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

### Docker-Compose

### Deployments

### Makefile
