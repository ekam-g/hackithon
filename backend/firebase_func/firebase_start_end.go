package firebase_func

import (
	"cloud.google.com/go/firestore"
	"context"
	firebase "firebase.google.com/go"
	"google.golang.org/api/option"
	"log"
)

func FirebaseInit() (err error, ctx context.Context, app *firebase.App, client *firestore.Client) {
	log.Println("FirebaseRead start")
	ctx = context.Background()
	file := option.WithCredentialsFile("firebase_func/stop-it-e1eae-firebase-adminsdk-2pg6p-0480ab5a11.json")
	app, err = firebase.NewApp(ctx, nil, file)
	if err != nil {
		log.Fatalln(err)
	}

	client, err = app.Firestore(ctx)
	if err != nil {
		log.Fatalln(err)
	}
	return err, ctx, app, client
}

func FirebaseClose(client *firestore.Client) {
	defer func(client *firestore.Client) {
		err := client.Close()
		if err != nil {
			log.Fatalln(err)
		}
	}(client)
	log.Println("FirebaseRead end")
}
