# Application (Runner)

Application is what we called the Runner. Every Golang project has a **main** package, in that package 
there is **main** method which will start our Golang application.

In k8s-golang, runner is _main.go_ file. In our runner, we initialize an **echo** server that listens on
port 8080 of a host.

### Note
Your project should only have one main method. If you want to have more than I main method, I recommend you 
to create different packages for each main method.

For example, If you have an application that needs to migration to database, use the following structure
and in your main package, execute one method based on what you need.
```shell
|_ serve
    |_ main.go 
|_ migrate 
    |_ main.go
```

P.S. You can use **Golang Cobra package**, it allows you to have more than one main methods at a project.

## Build and Run 
For Golang projects, we need to build our application to create our runner and then we execute
the runner.

The commands to do that are:
```
go build -o ./runner
./runner
```
