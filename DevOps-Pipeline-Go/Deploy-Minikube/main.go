package main

import (
	"context"
	"encoding/json"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type Answer struct {
	ID       string `json:"id,omitempty"`
	Answer_1 string `json:"answer1,omitempty"`
	Answer_2 string `json:"answer2,omitempty"`
	Answer_3 string `json:"answer3,omitempty"`
}

var client *mongo.Client

func main() {
	// Set up MongoDB connection
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	// You will need to update the MongoDB URI if you choose to run both the app and the database using the docker-compose replace "localhost" with "db"
	clientOptions := options.Client().ApplyURI("mongodb://localhost:27017")
	client, _ = mongo.Connect(ctx, clientOptions)

	router := mux.NewRouter()
	router.HandleFunc("/", GetQuestion).Methods("GET")
	router.HandleFunc("/", SubmitAnswer).Methods("POST")
	router.HandleFunc("/newquestion", NewQuestion).Methods("GET")
	router.HandleFunc("/newanswer", NewAnswer).Methods("POST")

	log.Fatal(http.ListenAndServe(":8080", router))
}

// Question 1
func GetQuestion(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode("What is your favorite programming language?")
}

// Question 2
func NewQuestion(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode("What is your favorite framework")
}

// Answer 1
func SubmitAnswer(w http.ResponseWriter, r *http.Request) {
	var answer Answer
	_ = json.NewDecoder(r.Body).Decode(&answer)

	log.Printf("answer.Answer_1: %v", answer.Answer_1)
	log.Printf("answer.Answer_2: %v", answer.Answer_2)
	log.Printf("answer.Answer_3: %v", answer.Answer_3)

	collection := client.Database("surveyDB").Collection("answers")
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	result, err := collection.InsertOne(ctx, bson.M{"Answer1": answer.Answer_1, "Answer2": answer.Answer_2, "Answer3": answer.Answer_3})
	if err != nil {
		log.Fatalf("Error inserting answer: %v", err)
	}

	json.NewEncoder(w).Encode(result.InsertedID)
}

// Answer 2
func NewAnswer(w http.ResponseWriter, r *http.Request) {
	var answer Answer
	_ = json.NewDecoder(r.Body).Decode(&answer)

	log.Printf("answer.Answer_1: %v", answer.Answer_1)
	log.Printf("answer.Answer_2: %v", answer.Answer_2)
	log.Printf("answer.Answer_3: %v", answer.Answer_3)

	collection := client.Database("surveyDB").Collection("answers")
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	result, err := collection.InsertOne(ctx, bson.M{"Answer1": answer.Answer_1, "Answer2": answer.Answer_2, "Answer3": answer.Answer_3})
	if err != nil {
		log.Fatalf("Error inserting answer: %v", err)
	}

	json.NewEncoder(w).Encode(result.InsertedID)
}
