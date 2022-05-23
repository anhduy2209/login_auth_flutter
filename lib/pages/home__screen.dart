// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  //document ID
  List<String> docIDs = [];

  //get docIDs
  Future getDocIDs() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              // docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  void initState() {
    getDocIDs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signed In Email: ' + user.email!,
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurple[400],
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Expanded(
            //   child: FutureBuilder(
            //     future: getDocIDs(),
            //     builder: ((context, snapshot) {
            //       return ListView.builder(
            //         itemCount: docIDs.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(docIDs[index]),
            //           );
            //         },
            //       );
            //     }),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
