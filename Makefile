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
