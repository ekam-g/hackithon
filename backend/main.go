package main

import (
	"CougarGenralBackend/firebase_func"
	"log"
)

func main() {
	err, data := firebase_func.FirebaseReadOne("Updates", "message")
	if err != nil {
		log.Fatalln(err)
	}

	err, data = firebase_func.FirebaseReadMany("permissions")
	if err != nil {
		log.Fatalln(err)
	}
	log.Println(data)
}
