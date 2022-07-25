package worker

import (
	"time"
)

type Worker struct {
	Value   int
	Timeout int
}

func (w *Worker) work() {
	for {
		w.Value++
		time.Sleep(time.Duration(w.Timeout) * time.Second)
	}
}

func (w *Worker) Start() {
	go w.work()
}
