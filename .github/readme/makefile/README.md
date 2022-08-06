# Makefile

Makefile is a simple file that allows us to alias terminal commands.
Insted of typing a command several times, we bind it to a make command.

For example, the following command builds and runs our Golang application:
```
go build -o ./runner
./runner
```

We can create a **Makefile** and do this:
```Makefile
make-app:
    go build -o ./runner
    ./runner
```

After that we can execute the commands with following command:
```
make make-app
```

So simple.