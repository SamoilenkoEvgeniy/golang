package main

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"net/http"
	"os"
)

func dbConnect() {
	db, err := sql.Open("mysql", "root:root@tcp(127.0.0.1:3306)/goland")

	if err != nil {
		panic(err)
	}
	defer db.Close()
}

func main() {

	var PORT string
	if PORT = os.Getenv("PORT"); PORT == "" {
		PORT = "3001"
	}
	dbConnect()
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello World from path: %s\n", r.URL.Path)
	})
	http.ListenAndServe(":"+PORT, nil)
}
