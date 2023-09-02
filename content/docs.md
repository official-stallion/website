+++
title = "docs"
date = "2023-09-01"
author = "amirhnajafiz"
+++

## How to use?

Get package:

```shell
go get github.com/official-stallion/stallion@latest
```

Now to set the client up you need to create a **stallion** server.<br />
Stallion server is the message broker server.

### Create server in Golang

```go
package main

import "github.com/official-stallion/stallion"

func main() {
	if err := stallion.NewServer(":9090"); err != nil {
		panic(err)
	}
}
```

### Create a server with docker

Check the docker [documentation](https://github.com/official-stallion/stable) for stallion server.

## Creating a server with Auth

You can create a Stallion server with username and password for Auth.
```go
package main

import "github.com/official-stallion/stallion"

func main() {
	if err := stallion.NewServer(":9090", "root", "Pa$$word"); err != nil {
		panic(err)
	}
}
```
