# Workflows

Github Workflows or (CI / CD) allows us to automatically build, test and etc. our Golang application.

## Sample
The following is a workflow config. It starts the given jobs when we push or pull request on master branch.

In the given jobs, It will setup Golang on ubuntu OS, and builds our application, then starts the tests.
If all goes well, it will pass the workflow.

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
