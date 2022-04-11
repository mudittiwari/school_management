// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Results.dart';

import 'Announcement.dart';
import 'Attendence.dart';
import 'Notice.dart';
import 'main.dart';

class Assignment extends StatefulWidget {
  DocumentSnapshot document;

  Assignment(this.document, {Key? key}) : super(key: key);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  TextEditingController assignment = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController due_date = TextEditingController();


  showvalidatorbox(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(margin: EdgeInsets.only(left: 7), child: Text(message)),
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

  Addassignment(BuildContext context) async {
    AlertDialog alert = AlertDialog(
        actions: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () async {
                // print("mudit");
                if(subject.text.trim().length==0 || assignment.text.trim().length==0 || due_date.text.trim().length==0)
                  {
                    showvalidatorbox(context, "Invalid assignment");
                  }
                else
                  {
                    showLoaderDialog(context);
                    await FirebaseFirestore.instance.collection("assignment").add({
                      'added_by': widget.document.get('name'),
                      'class': widget.document.get('class'),
                      'content': assignment.text.trim(),
                      'subject':subject.text.trim(),
                      'due_date': due_date.text.trim(),
                    });
                    assignment.text = "";
                    due_date.text = "";
                    subject.text="";
                    Navigator.pop(context);
                    Navigator.pop(context);
                    setState(() {});
                  }
              },
              child: Text("Create"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                assignment.text = "";
                due_date.text = "";
                subject.text="";
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
                          controller: due_date,
                          decoration:
                              InputDecoration(hintText: "Type due_date"),
                        ),
                        TextField(
                          controller: subject,
                          decoration:
                              InputDecoration(hintText: "Type Subject"),
                        ),
                        TextField(
                          controller: assignment,
                          decoration:
                          InputDecoration(hintText: "Type assignment"),
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

  EditAssignment(BuildContext context, String sub) async {
    AlertDialog alert = AlertDialog(
        actions: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () async {
                if(subject.text.trim().length==0 || assignment.text.trim().length==0 || due_date.text.trim().length==0)
                {
                  showvalidatorbox(context, "Invalid assignment");
                }
                else {
                  var ref;
                  // print("mudit");
                  showLoaderDialog(context);
                  await FirebaseFirestore.instance
                      .collection('assignment')
                      .where('due_date', isEqualTo: sub)
                      .get()
                      .then((value) {
                    ref = value.docs.first.id;
                    print(ref);
                  }).catchError((e) {
                    print(e);
                  });
                  await FirebaseFirestore.instance
                      .collection('assignment')
                      .doc(ref)
                      .update({
                    'content': assignment.text.trim(),
                    'due_date': due_date.text.trim(),
                    'subject': subject.text.trim(),
                  });
                  assignment.text = "";
                  due_date.text = "";
                  Navigator.pop(context);
                  Navigator.pop(context);
                  setState(() {});
                }
              },
              child: Text("Submit"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                assignment.text = "";
                due_date.text = "";
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
                          controller: due_date,
                          decoration:
                              InputDecoration(hintText: "Type new due_date"),
                        ),
                        TextField(
                          controller: subject,
                          decoration:
                              InputDecoration(hintText: "Type new subject"),
                        ),
                        TextField(
                          controller: assignment,
                          decoration:
                          InputDecoration(hintText: "Type new assignment"),
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

  Future<QuerySnapshot> getassignment() async {
    return await FirebaseFirestore.instance.collection('assignment').get();
  }

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
                onPressed: () => {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Profile",
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
                onPressed: () => {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Assignment",
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            //   child: Divider(
            //     height: 2,
            //     color: Colors.white,
            //   ),
            // ),
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
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();

                  Navigator.popUntil(
                      context,
                      ModalRoute.withName('/'));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
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
        title: Text("Assignment"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
            child: FutureBuilder(
              future: getassignment(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff342F2F),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Icon(Icons.error),
                  );
                } else {
                  int? cnt = snapshot.data?.docs.length;
                  if (cnt != null) {
                    cnt += 1;
                  } else {
                    cnt = 1;
                  }
                  return ListView.builder(
                    itemCount: cnt,
                    itemBuilder: (context, index) {
                      if (index == (cnt! - 1)) {
                        return widget.document.get('role') == "teacher"
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MaterialButton(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0, horizontal: 12),
                                          onPressed: () {
                                            Addassignment(context);
                                          },
                                          color: Color(0xffEEEEEE),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Text(
                                            "Add Assignment",
                                            style: TextStyle(
                                                color: Color(0xffEA5353),
                                                fontSize: 17),
                                          )),
                                    ]),
                              )
                            : Text("");
                      } else {
                        return Container(
                          child: Column(
                            children: [
                              ListTile(

                                title: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 0),
                                            child: Text(
                                              "Due Date: ",
                                              style: TextStyle(
                                                color: Color(0xffEA5353),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 0),
                                            child: Text(
                                              snapshot.data?.docs[index]
                                                  .get('due_date'),
                                              style: TextStyle(
                                                color: Color(0xffEA5353),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0, horizontal: 0),
                                            child: Text(
                                              "Subject: ",
                                              style: TextStyle(
                                                color: Color(0xffEA5353),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0, horizontal: 0),
                                            child: Text(
                                              snapshot.data?.docs[index]
                                                  .get('subject'),
                                              style: TextStyle(
                                                color: Color(0xffEA5353),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical:2.0),
                                        child: Text(snapshot.data?.docs[index]
                                            .get('content')),
                                      )
                                    ],
                                  ),
                                ),
                                trailing:
                                    widget.document.get('role') == 'teacher'
                                        ? IconButton(
                                            onPressed: () {
                                              EditAssignment(
                                                  context,
                                                  snapshot.data?.docs[index]
                                                      .get('due_date'));
                                            },
                                            icon: Icon(Icons.edit))
                                        : Text(""),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  height: 2,
                                  color: Color(0xffB6B0B0),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    },
                  );
                }
              },
              // child: ListView(
              //   children: [
              //     ListTile(
              //       leading: Container(
              //         height: 60,
              //         width: 60,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(30),
              //             color: Color(0xffC4C4C4)),
              //       ),
              //       title: Padding(
              //         padding: const EdgeInsets.only(top: 10.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.symmetric(
              //                   vertical: 4.0, horizontal: 0),
              //               child: Text(
              //                 "due_date",
              //                 style: TextStyle(
              //                   color: Color(0xffEA5353),
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //             ),
              //             Text(
              //                 "tLorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, facilisis in velit semper luctus. Iaculis consequat velit risus massa ut at a.")
              //           ],
              //         ),
              //       ),
              //       trailing: Icon(Icons.edit),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Divider(
              //         height: 2,
              //         color: Color(0xffB6B0B0),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ))
        ],
      ),
    );
  }
}
