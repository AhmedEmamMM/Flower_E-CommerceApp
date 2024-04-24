// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/model/data_from_firestore.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('userSSS');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pop(context);
            },
            label: Text(
              "logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: appbarGreen,
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                    color: appbarGreen,
                    borderRadius: BorderRadius.circular(11)),
                child: Text(
                  "Info from firebase Auth",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Email:   ${credential!.email}    ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    //DateFormat("MMMM d, y").format(  credential!.metadata.lastSignInTime!   );
                    "Created date:      ${DateFormat("MMMM d, y").format(credential!.metadata.creationTime!)}  ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Last Signed In:     ${DateFormat("MMMM d, y").format(credential!.metadata.lastSignInTime!)} ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                      credential!.delete();
                      users.doc(credential!.uid).delete();
                      Navigator.pop(context);
                  },
                  child: Text(
                    "Delete User",
                    style: TextStyle(fontSize: 17, color: appbarGreen),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                          color: appbarGreen,
                          borderRadius: BorderRadius.circular(11)),
                      child: Text(
                        "Info from firebase firestore",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))),
              GetDataFromFirestore(
                documentId: credential!.uid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
