package main

import (
	"fmt"
	"time"
)

const jobCount = 5
const workerCount = 3

func worker(id int, jobs <-chan int, results chan<- int) {
	for j := range jobs {
		fmt.Printf("Worker %d started job %d\n", id, j)

		// delay to simulate doing some work
		time.Sleep(time.Second)

		fmt.Printf("Worker %d finished job %d\n", id, j)
		results <- j * 2
	}
}

func main() {
	jobs := make(chan int, jobCount)
	results := make(chan int, jobCount)

	for w := 1; w <= workerCount; w++ {
		go worker(w, jobs, results)
	}

	for j := 1; j <= jobCount; j++ {
		jobs <- j
	}

	for a := 1; a <= jobCount; a++ {
		fmt.Println("Result: ", <-results)
	}
}
