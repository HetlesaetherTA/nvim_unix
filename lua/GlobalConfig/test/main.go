package main

import "fmt"

type User struct {
	ID       uint8  `json:"id"       yaml:"id"`
	Password string `json:"password" yaml:"password"`
}

func main() {
	fmt.Println("Hello, World!")
}
