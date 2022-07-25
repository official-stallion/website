package main

import (
	"fmt"
	"net/http"
	"strconv"
	"time"

	"github.com/labstack/echo/v4"
)

type Worker struct {
	Value   int
	Timeout int
}

func (w *Worker) Start() {
	go func() {
		for {
			w.Value++
			time.Sleep(time.Duration(w.Timeout) * time.Second)
		}
	}()
}

func main() {
	app := echo.New()

	worker := Worker{
		Value:   1,
		Timeout: 5,
	}
	worker.Start()

	app.GET("/", func(c echo.Context) error {
		s := fmt.Sprintf("%s: %s", time.Now().Format(time.ANSIC), strconv.Itoa(worker.Value))
		return c.String(http.StatusOK, s)
	})

	_ = app.Start("0.0.0.0:8080")
}
