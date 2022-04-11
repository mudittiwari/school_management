// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_management/main.dart';

import 'Announcement.dart';
import 'Assignment.dart';
import 'Attendence.dart';
import 'Notice.dart';
import 'Profile.dart';
import 'Results.dart';

class timeanddate extends StatefulWidget {
  @override
  _timeanddateState createState() => _timeanddateState();
}

class _timeanddateState extends State<timeanddate> {
  DateTime now = DateTime.now();
  late DateTime date;

  @override
  void initState() {
    date = DateTime(now.year, now.month, now.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 145,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 20,
                  width: 30,
                  color: Color(0xffDEDEDE),
                  child: Center(
                    child: Text(date.day.toString()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 20,
                  child: Center(
                    child: Text('/'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 20,
                  width: 30,
                  color: Color(0xffDEDEDE),
                  child: Center(
                    child: Text(date.month.toString()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 20,
                  child: Center(
                    child: Text('/'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 20,
                  width: 50,
                  color: Color(0xffDEDEDE),
                  child: Center(
                    child: Text(date.year.toString()),
                  ),
                ),
              ),

            ],
          ),
        ]));
  }
}

class Homepage extends StatefulWidget {
  // const Homepage({Key? key}) : super(key: key);
  DocumentSnapshot document;

  Homepage(this.document, {Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController time = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController roomno = TextEditingController();
  TextEditingController teacher = TextEditingController();

  Future<QuerySnapshot> getclasses() async {
    return await FirebaseFirestore.instance
        .collection('subjects')
        .where('class', isEqualTo: widget.document.get('class'))
        .get();
  }

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

  showaddclass(BuildContext context) async {
    AlertDialog alert = AlertDialog(
        actions: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () async {
                // print("mudit");
                showLoaderDialog(context);
                var id;
                await FirebaseFirestore.instance
                    .collection('subjects')
                    .where('class', isEqualTo: widget.document.get('class'))
                    .get()
                    .then((value) {
                  id = value.docs.first.id;
                });
                await FirebaseFirestore.instance
                    .collection('subjects')
                    .doc(id)
                    .update({
                  'subjects': FieldValue.arrayUnion([
                    {
                      "teacher": teacher.text.trim(),
                      "time": time.text.trim(),
                      "subject": name.text.trim(),
                      'room': roomno.text.trim()
                    }
                  ])
                });

                name.text = "";
                teacher.text = "";
                roomno.text = "";
                time.text = "";
                Navigator.pop(context);
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Create"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                name.text = "";
                teacher.text = "";
                roomno.text = "";
                time.text = "";
              },
              child: Text("Cancel"),
            ),
          )
        ],
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 7),
                    child: Column(
                      children: [
                        TextField(
                          controller: name,
                          decoration: InputDecoration(hintText: "Type subject"),
                        ),
                        TextField(
                          controller: roomno,
                          decoration:
                              InputDecoration(hintText: "Type room no."),
                        ),
                        TextField(
                          controller: teacher,
                          decoration:
                              InputDecoration(hintText: "Type teacher name"),
                        ),
                        TextField(
                          controller: time,
                          decoration: InputDecoration(hintText: "Type time"),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
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
    // print(widget.document);
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Color(0xff342F2F),
          child: ListView(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(widget.document)))
                      },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  elevation: 0,
                  color: Color(0xff342F2F)),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Homepage(widget.document)))
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Home",
                      )),
                ),
                color: Color(0xffDBD9D9),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Attendence(widget.document)))
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Assignment(widget.document)))
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
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            //   child: MaterialButton(
            //     onPressed: () => {},
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
            //       child: Align(
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             "Department",
            //             style: TextStyle(color: Colors.white),
            //           )),
            //     ),
            //     color: Color(0xff342F2F),
            //     elevation: 0,
            //   ),
            // ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Results(widget.document)))
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Notice(widget.document)))
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Announcement(widget.document)))
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.popUntil(context, ModalRoute.withName('/'));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
          ])),
      appBar: AppBar(
        backgroundColor: Color(0xff342F2F),
        title: Text(widget.document.get('name')),
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
                Text("TODAY'S CLASSES",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Color(0xffEA5353))),
                timeanddate(),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getclasses(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Icon(Icons.error),
                  );
                } else {
                  int? cnt = 0;
                  cnt = snapshot.data?.docs.first.get('subjects').length;
                  if (cnt == null) {
                    cnt = 1;
                  } else {
                    cnt += 1;
                  }
                  return ListView.builder(
                    itemCount: cnt,
                    itemBuilder: (context, index) {
                      if (index == (cnt! - 1)) {
                        return widget.document.get('role') == 'teacher'
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 12),
                                    onPressed: () {
                                      showaddclass(context);
                                    },
                                    color: Color(0xffEEEEEE),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "Add Class",
                                      style: TextStyle(
                                          color: Color(0xffEA5353),
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              )
                            : Text("");
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
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
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                  snapshot.data?.docs.first.get(
                                                          'subjects')[index]
                                                      ['subject'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  )),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                  snapshot.data?.docs.first.get(
                                                          'subjects')[index]
                                                      ['room'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  )),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                  snapshot.data?.docs.first.get(
                                                          'subjects')[index]
                                                      ['teacher'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  )),
                                            ),
                                          ],
                                        ),
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
                                      child: Text(
                                          snapshot.data?.docs.first
                                              .get('subjects')[index]['time'],
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
                      );
                    },
                  );
                }
              },
            ),
            // child: ListView(
            //   children: [
            //     Padding(
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            //       child: SizedBox(
            //         height: 125,
            //         width: MediaQuery.of(context).size.width,
            //         child: Stack(children: [
            //           Align(
            //             alignment: Alignment.centerRight,
            //             child: Container(
            //                 width: MediaQuery.of(context).size.width * .9,
            //                 height: 125,
            //                 color: Color(0xff342F2F),
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(left: 80.0),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: const [
            //                           Padding(
            //                             padding: EdgeInsets.all(4.0),
            //                             child: Text("Class Name",
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontSize: 18,
            //                                 )),
            //                           ),
            //                           Padding(
            //                             padding: EdgeInsets.all(4.0),
            //                             child: Text("Room No.- 00",
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontSize: 18,
            //                                 )),
            //                           ),
            //                           Padding(
            //                             padding: EdgeInsets.all(4.0),
            //                             child: Text("Teacher Name",
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontSize: 18,
            //                                 )),
            //                           ),
            //                         ],
            //                       ),
            //                       Padding(
            //                         padding: const EdgeInsets.only(right: 8.0),
            //                         child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.end,
            //                             children: [
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     bottom: 10),
            //                                 child: MaterialButton(
            //                                   color: Colors.white,
            //                                   onPressed: () => {},
            //                                   child: Text("Join"),
            //                                 ),
            //                               )
            //                             ]),
            //                       )
            //                     ],
            //                   ),
            //                 )),
            //           ),
            //           Align(
            //             alignment: Alignment.centerLeft,
            //             child: Container(
            //               decoration: BoxDecoration(
            //                   color: Color(0xffEA5353),
            //                   borderRadius: BorderRadius.circular(12)),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Center(
            //                     child: Text("12:00 PM",
            //                         style: TextStyle(
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 18))),
            //               ),
            //               height: 100,
            //               width: 100,
            //             ),
            //           )
            //         ]),
            //       ),
            //     ),
            //
            //     widget.document.get('role') == 'teacher'
            //         ? Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             MaterialButton(
            //                 padding:
            //                     EdgeInsets.symmetric(vertical: 2.0, horizontal: 12),
            //                 onPressed: () {
            //                   showaddclass();
            //                 },
            //                 color: Color(0xffEEEEEE),
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(8)),
            //                 child: Text(
            //                   "Add Class",
            //                   style:
            //                       TextStyle(color: Color(0xffEA5353), fontSize: 17),
            //                 ),
            //               ),
            //           ],
            //         )
            //         : Text(""),
            //   ],
            // ),
          )
        ],
      ),
    );
  }
}
