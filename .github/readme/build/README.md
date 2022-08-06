# Docker

In order to deploy our application, we need to build a docker image for our application.

To build a docker image we need a dockerfile. Dockerfiles should go inside a build directory.

A simple dockerfile for Golang applications goes like this:
```Dockerfile
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
CMD ["/bin/main"]
```
