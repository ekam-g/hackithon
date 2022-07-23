package firebase_func

import (
	"fmt"
	"google.golang.org/api/iterator"
	"log"
)

func FirebaseReadOne(path string, id string) (err error, data map[string]interface{}) {
	err, ctx, _, client := FirebaseInit()
	dsnap, err := client.Collection(path).Doc(id).Get(ctx)
	if err != nil {
		log.Fatalln(err)
		return
	}
	data = dsnap.Data()
	FirebaseClose(client)
	return err, data
}

func FirebaseReadMany(path string) (err error, data map[string]interface{}) {
	err, ctx, _, client := FirebaseInit()
	dsnap := client.Collection(path).Documents(ctx)
	for {
		doc, err := dsnap.Next()
		if err == iterator.Done {
			break
		}
		if err != nil {
			log.Fatalf("Failed to iterate: %v", err)
		}
		fmt.Println(doc.Data())
	}
	return err, data
}
