package main

import (
	"asciiartweb/handlers"
	"asciiartweb/server"
	"errors"
	"html/template"
	"log"
	"net/http"
	"os"
)

var tmpl *template.Template
var tmplError *template.Template

func main() {
	err := handlers.InitTemplates()
	if err != nil {
		log.Fatalf("error: %v", err)
	}

	tmpl, err = template.ParseFiles("templates/index.html")
	if err != nil {
		log.Fatalf("Error loading: %v", err)
	}

	http.HandleFunc("/static/", func(w http.ResponseWriter, r *http.Request) {
		path := r.URL.Path[len("/static/"):]
		_, err := os.Stat(r.URL.Path[1:])
		if path == "" || errors.Is(err, os.ErrNotExist) {
			handlers.NotFoundHandler(w, r)
			return
		}
		http.StripPrefix("/static/", http.FileServer(http.Dir("static"))).ServeHTTP(w, r)
	})

	http.HandleFunc("/", server.RouteHandler(tmpl, tmplError))

	http.HandleFunc("/submit", server.WithRecovery(handlers.SubmitHandler(tmpl)))

	http.HandleFunc("/test500", func(w http.ResponseWriter, r *http.Request) {
		handlers.InternalServerErrorHandler(w, r)
	})

	log.Println("Сервер запущен на : http://localhost:8080/")
	err = http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatalf("Ошибка запуска сервера: %v", err)
	}
}
