import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DisHomepage extends StatefulWidget {
  const DisHomepage({Key? key}) : super(key: key);

  @override
  _DisHomepageState createState() => _DisHomepageState();
}

class _DisHomepageState extends State<DisHomepage> {
  String email = FirebaseAuth.instance.currentUser?.email.toString() ?? "Error";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Distribution AI"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Expanded(
                flex: 10,
                child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("stuff")
                      .doc(email)
                      .snapshots(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                          height: 250,
                          width: 250,
                          child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Text('Error');
                    }
                    final display = snapshot.requireData;
                    if (display["name1"]["name"] == null) {
                      return const Text(
                          "Please Upgrade Your Account to Offer More Services");
                    }
                    if (snapshot.hasData) {
                      return SizedBox(
                        width: 300,
                        height: 450,
                        child: Column(
                          children: [
                            const Spacer(),
                            Text(display["name1"]["name"].toString()),
                            const Spacer(),
                            Text(display["name2"]["name"].toString()),
                            const Spacer(),
                            Text(display["name3"]["name"].toString()),
                            const Spacer(),
                            Text(display["name4"]["name"].toString()),
                            const Spacer(),
                            Text(display["name5"]["name"].toString()),
                            const Spacer(),
                          ],
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
