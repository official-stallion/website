# run
run:
	go run main.go
# build
build:
	go build -o /main
# docker build
docker-build:
	docker build . -t amirhossein21/gubernetes
# docker push:
docker-push:
	docker push amirhossein21/gubernetes
