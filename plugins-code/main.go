package main

import (
	"github.com/hashicorp/go-s2-plugin/sentinel-plugin/plugins"
)

func main() {
	plugins.RegisterFunction("echo", echo)
	plugins.RegisterFunction("isempty", isempty)
	plugins.Serve()
}

func echo(value string) (string, error) {
	print(value)
	return value, nil
}

func isempty(value string) bool {
	return len(value) > 0
}
