package main

import (
	"net/http"
	"strconv"

	"github.com/amirhnajafiz/k8s-golang/app/worker"
	"github.com/labstack/echo/v4"
)

func main() {
	app := echo.New()

	worker := worker.Worker{
		Value:   1,
		Timeout: 5,
	}
	worker.Start()

	app.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, strconv.Itoa(worker.Value))
	})

	_ = app.Start("0.0.0.0:8080")
}
