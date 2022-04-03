// import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_management/Announcement.dart';
import 'package:school_management/Assignment.dart';
import 'package:school_management/Attendence.dart';
import 'package:school_management/Notice.dart';
import 'package:school_management/Results.dart';

import 'Profile.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Color(0xff342F2F),
          child: ListView(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()))
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Profile",
                        )),
                  ),
                  color: Color(0xffDBD9D9)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () => {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Attendence()))
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Attendance",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Assignment()))
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Assignment",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () => {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Department",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Results()))
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Results",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notice()))
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Notice",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Announcement()))
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Announcement",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
          ])),
      appBar: AppBar(
        backgroundColor: Color(0xff342F2F),
        title: Text("Student's Name"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TODAY CLASSES",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xffEA5353))),
                SizedBox(
                    width: 90,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Color(0xffDEDEDE),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Color(0xffDEDEDE),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: Color(0xffDEDEDE),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Date"),
                          )
                        ]))
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: SizedBox(
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: MediaQuery.of(context).size.width * .9,
                            height: 125,
                            color: Color(0xff342F2F),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Class Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Room No.- 00",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Teacher Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: MaterialButton(
                                              color: Colors.white,
                                              onPressed: () => {},
                                              child: Text("Join"),
                                            ),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEA5353),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text("12:00 PM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))),
                          ),
                          height: 100,
                          width: 100,
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: SizedBox(
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: MediaQuery.of(context).size.width * .9,
                            height: 125,
                            color: Color(0xff342F2F),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Class Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Room No.- 00",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Teacher Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: MaterialButton(
                                              color: Colors.white,
                                              onPressed: () => {},
                                              child: Text("Join"),
                                            ),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEA5353),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text("12:00 PM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))),
                          ),
                          height: 100,
                          width: 100,
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: SizedBox(
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: MediaQuery.of(context).size.width * .9,
                            height: 125,
                            color: Color(0xff342F2F),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 80.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Class Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Room No.- 00",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text("Teacher Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: MaterialButton(
                                              color: Colors.white,
                                              onPressed: () => {},
                                              child: Text("Join"),
                                            ),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffEA5353),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text("12:00 PM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))),
                          ),
                          height: 100,
                          width: 100,
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
