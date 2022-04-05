// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Announcement.dart';
import 'Assignment.dart';
import 'Attendence.dart';
import 'Homepage.dart';
import 'Profile.dart';
import 'Results.dart';

class Notice extends StatefulWidget {
  DocumentSnapshot document;

  Notice(this.document, {Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  TextEditingController notice = TextEditingController();
  TextEditingController subject = TextEditingController();

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

  Addnotice(BuildContext context) async {
    AlertDialog alert = AlertDialog(
        actions: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () async {
                // print("mudit");
                showLoaderDialog(context);
                await FirebaseFirestore.instance.collection("notice").add({
                  'added_by': widget.document.get('name'),
                  'content': notice.text.trim(),
                  'subject': subject.text.trim(),
                });
                notice.text = "";
                subject.text = "";
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
                notice.text = "";
                subject.text = "";
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
                          controller: subject,
                          decoration: InputDecoration(hintText: "Type subject"),
                        ),
                        TextField(
                          controller: notice,
                          decoration: InputDecoration(hintText: "Type notice"),
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

  Editnotice(BuildContext context, String sub) async {
    AlertDialog alert = AlertDialog(
        actions: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () async {
                var ref;
                // print("mudit");
                showLoaderDialog(context);
                await FirebaseFirestore.instance
                    .collection('notice')
                    .where('subject', isEqualTo: sub)
                    .get()
                    .then((value) {
                  ref = value.docs.first.id;
                  print(ref);
                }).catchError((e) {
                  print(e);
                });
                await FirebaseFirestore.instance.collection('notice').doc(ref).update({
                  'content': notice.text.trim(),
                  'subject': subject.text.trim(),
                });
                notice.text = "";
                subject.text = "";
                Navigator.pop(context);
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Submit"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                notice.text = "";
                subject.text = "";
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
                          controller: subject,
                          decoration:
                              InputDecoration(hintText: "Type new subject"),
                        ),
                        TextField(
                          controller: notice,
                          decoration:
                              InputDecoration(hintText: "Type new notice"),
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

  Future<QuerySnapshot> getnotice() async {
    return await FirebaseFirestore.instance.collection('notice').get();
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
                  onPressed: () =>
                  {
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () =>
                {
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
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () =>
                {
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () =>
                {
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () =>
                {
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () =>
                {
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

                      )),
                ),

                color:Color(0xffDBD9D9),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: MaterialButton(
                onPressed: () =>
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Announcement(widget.document)))
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
                color:  Color(0xff342F2F),
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 0),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
          ])),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("NOTICE"),
        centerTitle: true,
        backgroundColor: Color(0xff342F2F),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
            child: FutureBuilder(
              future: getnotice(),
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
                  if (cnt != null)
                    cnt += 1;
                  else
                    cnt = 1;
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
                                            Addnotice(context);
                                          },
                                          color: Color(0xffEEEEEE),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Text(
                                            "Add Notice",
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
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xffC4C4C4)),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 0),
                                        child: Text(
                                          snapshot.data?.docs[index]
                                              .get('subject'),
                                          style: TextStyle(
                                            color: Color(0xffEA5353),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Text(snapshot.data?.docs[index]
                                          .get('content'))
                                    ],
                                  ),
                                ),
                                trailing:
                                    widget.document.get('role') == 'teacher'
                                        ? IconButton(
                                            onPressed: () {
                                              Editnotice(
                                                  context,
                                                  snapshot.data?.docs[index]
                                                      .get('subject'));
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
              //                 "Subject",
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
