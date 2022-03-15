package main

import (
	"net/http"
	
	"github.com/labstack/echo/v4"
)

func main() {
	app := echo.New()

	app.GET("/hello", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello world)
	})

	app.Start("0.0.0.0:1380")
}
