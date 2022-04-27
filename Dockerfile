# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:latest-alpine as build

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

# Executing the main file
ENTRYPOINT ["/bin/main"]
