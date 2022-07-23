import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/ai_dis/dis_moredata.dart';
import 'package:frontend/widgets/coolButtion.dart';

class DisHomepage extends StatefulWidget {
  const DisHomepage({Key? key}) : super(key: key);

  @override
  _DisHomepageState createState() => _DisHomepageState();
}

class _DisHomepageState extends State<DisHomepage> {
  String email = FirebaseAuth.instance.currentUser?.email.toString() ?? "empty";

  @override
  Widget build(BuildContext context) {
    if (email == "empty") {
      return const Center(
        child: Text(
            "Please Upgrade Your Account to Offer More Services or this was disabled"),
      );
    }
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

                    if (snapshot.hasData) {
                      try {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DisMoredata(
                                              data: display['name1'],
                                              account: email,
                                              user: 'name1',
                                            )),
                                  );
                                },
                                text: display["name1"]["name"].toString(),
                                height: 50,
                                fontSize: 15,
                                width: 200),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DisMoredata(
                                              data: display['name2'],
                                              account: email,
                                              user: 'name2',
                                            )),
                                  );
                                },
                                text: display["name2"]["name"].toString(),
                                height: 50,
                                fontSize: 15,
                                width: 200),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DisMoredata(
                                              data: display['name3'],
                                              account: email,
                                              user: 'name3',
                                            )),
                                  );
                                },
                                text: display["name3"]["name"].toString(),
                                height: 50,
                                fontSize: 15,
                                width: 200),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DisMoredata(
                                              data: display['name4'],
                                              account: email,
                                              user: 'name4',
                                            )),
                                  );
                                },
                                text: display["name4"]["name"].toString(),
                                height: 50,
                                fontSize: 15,
                                width: 200),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DisMoredata(
                                              data: display['name5'],
                                              account: email,
                                              user: 'name5',
                                            )),
                                  );
                                },
                                text: display["name5"]["name"].toString(),
                                height: 50,
                                fontSize: 15,
                                width: 200),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      } catch (e) {
                        return const Center(
                          child: Text(
                              "Please Upgrade Your Account to Offer More Services or this was disabled"),
                        );
                      }
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
