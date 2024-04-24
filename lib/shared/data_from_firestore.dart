// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetDataFromFirestore extends StatefulWidget {
  final String documentId;

  const GetDataFromFirestore({super.key, required this.documentId});

  @override
  State<GetDataFromFirestore> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestore> {
  final dialongusernameController = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('userSSS');

  ShowMyDialog(Map data ,dynamic myKey) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Container(
            padding: EdgeInsets.all(22),
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    controller: dialongusernameController,
                    maxLength: 20,
                    decoration:
                        InputDecoration(hintText: "${data[myKey]}")     ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                users.doc(credential!.uid).update(
                                    {myKey: dialongusernameController.text});
                                Navigator.pop(context);
                                dialongusernameController.text = "";
                              });
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(fontSize: 22),
                            )),
                            TextButton(
                            onPressed: () {
                              dialongusernameController.text = "";
                            },
                            child: Text(
                              "Clear",
                              style: TextStyle(fontSize: 22),
                            ))
                      ],
                    ),
                    TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 22),
                            )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Full Name : ${data['username']} ",
                    style: TextStyle( fontSize: 17 ,color: Colors.black ,fontWeight:FontWeight.bold ),
                  ),
                  IconButton(
                      onPressed: () {
                        ShowMyDialog(data , 'username');
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                "Age      : ${data['age']} Years old ",
                    style: TextStyle( fontSize: 17 ,color: Colors.black ,fontWeight:FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        ShowMyDialog(data , 'age');
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                "Title    : ${data['title']} ",
                    style: TextStyle( fontSize: 17 ,color: Colors.black ,fontWeight:FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        ShowMyDialog(data ,'title');
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                "Email    : ${data['email']} ",
                    style: TextStyle( fontSize: 17 ,color: Colors.black ,fontWeight:FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        ShowMyDialog(data , 'email');
                      },
                      icon: Icon(Icons.edit))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                "Pass     : ${data['pass']} ",
                    style: TextStyle( fontSize: 17 ,color: Colors.black ,fontWeight:FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        ShowMyDialog(data , 'pass');
                      },
                      icon: Icon(Icons.edit))
                ],
              ), 
            
            Center(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        users.doc(credential!.uid).delete();
                      });
                    },
                    child: Text(
                      "Delete All info",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}
