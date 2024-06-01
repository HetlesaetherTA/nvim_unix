package main

import (
	"testing"
)

func TestHello(t *testing.T) {
	message := "Hello, Neovim DAP!"
	if message != "Hello, Neovim DAP!" {
		t.Errorf("Expected 'Hello, Neovim DAP!', but got '%s'", message)
	}
}

func Test_main(t *testing.T) {
	tests := []struct {
		name string
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			main()
		})
	}
}
