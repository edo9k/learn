
package main

import "fmt"

func main() { 
  for i := 1; i <= 100; i++ {
    fizz := i % 3 == 0
    buzz := i % 5 == 0

    if fizz && buzz {
      fmt.Println("fizzbuzz") 
    } else if fizz {
      fmt.Println("fizz")
    } else if buzz { 
      fmt.Println("buzz")
    } else {
      fmt.Println(i)
    }
  }
}

