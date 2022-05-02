package main

import (
	"net/http"
	"time"

	"github.com/labstack/echo/v4"
)

func main() {
	app := echo.New()

	app.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, time.Now().Format(time.RFC1123))
	})

	app.GET("/hello", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello world")
	})

	_ = app.Start("0.0.0.0:8080")
}
