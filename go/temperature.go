
package main

import "fmt"

func main() {
  fmt.Println("32 C should be 89.6 F.")
  fmt.Println(celcius2fahrenheit(32))
}

func celcius2fahrenheit(temp float64) float64 { 
  return (temp * 1.8) + 32.0 
} 
