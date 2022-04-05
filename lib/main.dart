// import 'dart:html';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Announcement.dart';
import 'package:school_management/Assignment.dart';
import 'package:school_management/Attendence.dart';
import 'package:school_management/Homepage.dart';
import 'package:school_management/Notice.dart';
import 'package:school_management/Results.dart';
import 'package:school_management/Signup.dart';

import 'Profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            color: Color(0xffEA5353),
          ),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              image: AssetImage("assets/images/login.png"),
              height: MediaQuery.of(context).size.height * .8,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 128.0, left: 20),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    height: 200,
                    width: MediaQuery.of(context).size.width * .8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 4),
                            child: TextField(
                              controller: email,
                              decoration:
                                  InputDecoration(hintText: "User Name"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 4),
                            child: TextField(
                              controller: password,
                              decoration: InputDecoration(hintText: "Password"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 4),
                            child: TextField(
                              controller: role,
                              decoration: InputDecoration(hintText: "Role"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // color: Colors.blue,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 270.0, right: 59),
                child: Align(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () async {
                      showLoaderDialog(context);

                      // await FirebaseFirestore.instance
                      //     .collection('students')
                      //     .get()
                      //     .then((value) => print(value.docs));
                      FirebaseFirestore.instance
                          .collection(role.text.trim())
                          .where('email', isEqualTo: email.text.trim())
                          .get()
                          .then((document) async {
                        // print(value.docs);

                        if (document.docs.isEmpty) {
                          // print("user not found");
                          Navigator.pop(context);
                        } else {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text.trim(),
                                  password: password.text.trim())
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage(document.docs.first)));
                          }).catchError((e) {
                            Navigator.pop(context);
                            print(e);
                          });
                        }
                      }).catchError((e) {
                        Navigator.pop(context);
                        print(e);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 14),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Color(0xff342F2F),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 14),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    color: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
