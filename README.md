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

### Docker

### Docker-Compose

### Deployments

### Makefile
