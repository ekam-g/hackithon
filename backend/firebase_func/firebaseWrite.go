package firebase_func

import "log"

func FirebaseWriteAny(collection string, whatWrite map[string]interface{}) (err error) {
	err, ctx, _, client := FirebaseInit()
	defer FirebaseClose(client)
	_, _, err = client.Collection(collection).Add(ctx, whatWrite)
	if err != nil {
		log.Fatalf("Failed due to: %v", err)
	}
	return err
}

func FirebaseWriteOne(collection string, doc string, whatWrite map[string]interface{}) (err error) {
	err, ctx, _, client := FirebaseInit()
	defer FirebaseClose(client)
	_, err = client.Collection(collection).Doc(doc).Set(ctx, whatWrite)
	if err != nil {
		err = nil
		log.Fatalf("Failed due to: %v", err)
	}
	return err
}
