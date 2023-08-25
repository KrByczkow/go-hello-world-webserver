package main

import (
	"fmt"
	"net/http"
)

func runServer(w http.ResponseWriter, r *http.Request) {
	_, err := fmt.Fprintf(w, "Hello, World!")
	if err != nil {
		return
	}
}

func main() {
	http.HandleFunc("/", runServer)

	port := 8080
	sPort := fmt.Sprintf(":%d", port)

	fmt.Printf("Server started on port %d\n", port)
	err := http.ListenAndServe(sPort, nil)

	if err != nil {
		fmt.Printf("[Error] Failed to start a server on port %d: \"%v\"\n", port, err)
	}
}
