import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_management/main.dart';
import 'Homepage.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController class_ = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController mobno = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController fathermobno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(color: Color(0xffEA5353),),
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
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 85),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white),
                  height: 500,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: name,
                            decoration: InputDecoration(hintText: "Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(hintText: "Email"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: class_,
                            decoration: InputDecoration(hintText: "Class"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: rollno,
                            decoration: InputDecoration(hintText: "Roll No."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: mobno,
                            decoration: InputDecoration(hintText: "mobile no."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: fathername,
                            decoration:
                                InputDecoration(hintText: "Father's Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: fathermobno,
                            decoration: InputDecoration(
                                hintText: "Father's mobile no."),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(hintText: "Password"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 4),
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
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, right: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () async {
                      showLoaderDialog(context);
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email.text.trim(), password: password.text.trim())
                          .then((value) async{
                            if(role.text.trim()=="student")
                              {
                                FirebaseFirestore.instance.collection('student').add({
                                  'name':name.text.trim(),
                                  'email':email.text.trim(),
                                  'class':class_.text.trim(),
                                  'rollno':rollno.text.trim(),
                                  'mobno':mobno.text.trim(),
                                  'father':fathername.text.trim(),
                                  'fathermob':fathermobno.text.trim(),

                                });
                              }
                            else if(role.text.trim()=="teacher")
                            {
                              FirebaseFirestore.instance.collection('teacher').add({
                                'name':name.text.trim(),
                                'email':email.text.trim(),
                                'class':class_.text.trim(),
                                'mobno':mobno.text.trim(),
                              });
                            }
                            else
                              {
                                FirebaseFirestore.instance.collection('principal').add({
                                  'name':name.text.trim(),
                                  'email':email.text.trim(),
                                  'mobno':mobno.text.trim(),
                                });
                              }
                      })
                          .catchError((e) {
                        print(e);
                      });
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 14),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Color(0xff342F2F),
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
