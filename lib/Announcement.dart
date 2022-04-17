// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Assignment.dart';
import 'Attendence.dart';
import 'Homepage.dart';
import 'Notice.dart';
import 'Profile.dart';
import 'Results.dart';
import 'main.dart';

class Announcement extends StatefulWidget {
  DocumentSnapshot document;

  Announcement(this.document, {Key? key}) : super(key: key);

  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  TextEditingController announcement = TextEditingController();

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

  Addannouncemnet(BuildContext context) async {
    AlertDialog alert = AlertDialog(
        actions: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () async {
                if(announcement.text.trim().length==0)
                  {
                    showvalidatorbox(context, "Invalid Announcement");
                  }
                else {
                  // print("mudit");
                  showLoaderDialog(context);
                  await FirebaseFirestore.instance
                      .collection("announcement")
                      .add({
                    'added_by': widget.document.get('name'),
                    'content': announcement.text.trim(),
                  });
                  announcement.text = "";
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
                announcement.text = "";
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
                    child: TextField(
                      controller: announcement,
                      decoration: InputDecoration(hintText: "Type Annoucement"),
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
  Editannouncement(BuildContext context, String sub) async {
    AlertDialog alert = AlertDialog(
        actions: [
          Container(
            margin: EdgeInsets.only(left: 7),
            child: MaterialButton(
              onPressed: () async {
                if(announcement.text.trim().length==0)
                {
                  showvalidatorbox(context, "Invalid Announcement");
                }
                else {
                  var ref;
                  // print("mudit");
                  showLoaderDialog(context);
                  await FirebaseFirestore.instance
                      .collection('announcement')
                      .where('content', isEqualTo: sub)
                      .get()
                      .then((value) {
                    ref = value.docs.first.id;
                    print(ref);
                  }).catchError((e) {
                    print(e);
                  });
                  await FirebaseFirestore.instance.collection('announcement')
                      .doc(ref)
                      .update({
                    'content': announcement.text.trim(),
//                    'subject': subject.text.trim(),
                  });
                  announcement.text = "";
//                  subject.text = "";
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
                announcement.text = "";
//                subject.text = "";
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
                          controller: announcement,
                          decoration:
                          InputDecoration(hintText: "Type new announcement"),
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

  Future<QuerySnapshot> getannouncements() async {
    return await FirebaseFirestore.instance.collection('announcement').get();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.document.get('role'));
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
                                  builder: (context) =>
                                      Profile(widget.document)))
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
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
//              Padding(
//                padding:
//                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                child: MaterialButton(
//                  onPressed: () => {},
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(
//                        vertical: 14.0, horizontal: 0),
//                    child: Align(
//                        alignment: Alignment.centerLeft,
//                        child: Text(
//                          "Department",
//                          style: TextStyle(color: Colors.white),
//                        )),
//                  ),
//                  color: Color(0xff342F2F),
//                  elevation: 0,
//                ),
//              ),
//              Padding(
//                padding:
//                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
//                child: Divider(
//                  height: 2,
//                  color: Colors.white,
//                ),
//              ),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
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
                            builder: (context) =>
                                Announcement(widget.document)))
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Announcement",
                        )),
                  ),
                  color: Color(0xffDBD9D9),
                  elevation: 0,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
          // automaticallyImplyLeading: false,
          title: Text("ANNOUNCEMENT"),
          centerTitle: true,
          backgroundColor: Color(0xff342F2F),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getannouncements(),
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
                          return widget.document.get('role') == "teacher"||widget.document.get('role')=='principal'
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0, horizontal: 12),
                                            onPressed: () {
                                              Addannouncemnet(context);
                                            },
                                            color: Color(0xffEEEEEE),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Text(
                                              "Add Announcement",
                                              style: TextStyle(
                                                  color: Color(0xffEA5353),
                                                  fontSize: 17),
                                            )),
                                      ]),
                                )
                              : Text("");
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xffC4C4C4),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  child: Text(""),
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Color(0xffEA5353),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Expanded(
//                                  flex: 10,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                    dense: true,
                                    title: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 4),
                                            child: Text(
                                              snapshot.data?.docs[index]
                                                  .get('content'),
                                              style: TextStyle(
//                                                  color: Color(0xffEA5353),
                                                fontSize: 18,
//                                                  fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: widget.document.get('role') ==
                                            'teacher'||widget.document.get('role')=='principal'
                                        ? Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: IconButton(
                                                onPressed: () {
                                            Editannouncement(
                                                context,
                                                snapshot.data?.docs[index]
                                                    .get('content'));
                                                },
                                                icon: Icon(Icons.edit)),
                                          )
                                        : Text(""),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    // return Column
                    //   (
                    //   children: [
                    //     Expanded
                    //       (
                    //       child: Padding
                    //         (
                    //         padding: const EdgeInsets.symmetric(vertical: 8.0
                    //             ,
                    //             horizontal: 0
                    //         )
                    //         ,
                    //         child: ListView.builder(itemBuilder: itemBuilder)
                    //           (
                    //           children: [
                    //             Padding
                    //               (
                    //               padding: const EdgeInsets.all(8.0
                    //               )
                    //               ,
                    //               child: Container
                    //                 (
                    //                 height: 200
                    //                 ,
                    //                 decoration: BoxDecoration
                    //                   (
                    //                   color: Color
                    //                     (0xffC4C4C4)
                    //                   ,
                    //                 )
                    //                 ,
                    //                 child: Row
                    //                   (
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Container
                    //                       (
                    //                       height: 200
                    //                       ,
                    //                       child: Text
                    //                         (""
                    //                       )
                    //                       ,
                    //                       width: 10
                    //                       ,
                    //                       decoration: BoxDecoration
                    //                         (
                    //                           color: Color
                    //                             (0xffEA5353)
                    //                           ,
                    //                           borderRadius: BorderRadius.circular(5
                    //                           )
                    //                       )
                    //                       ,
                    //                     )
                    //                     ,
                    //                     Expanded
                    //                       (
                    //                         child: Padding
                    //                           (
                    //                           padding: const EdgeInsets.all(10.0
                    //                           )
                    //                           ,
                    //                           child: Text
                    //                             (
                    //                             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu. dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam
                    //                             "
                    //                             ,
                    //                             style: TextStyle
                    //                               (
                    //                               fontSize: 17,
                    //                             ),
                    //                           ),
                    //                         )),
                    //                   ],
                    //                 )
                    //                 ,
                    //               )
                    //               ,
                    //             )
                    //             ,
                    //             Padding
                    //               (
                    //               padding: const EdgeInsets.all(8.0
                    //               )
                    //               ,
                    //               child: Container
                    //                 (
                    //                 height: 200
                    //                 ,
                    //                 decoration: BoxDecoration
                    //                   (
                    //                   color: Color
                    //                     (0xffC4C4C4)
                    //                   ,
                    //                 )
                    //                 ,
                    //                 child: Row
                    //                   (
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Container
                    //                       (
                    //                       height: 200
                    //                       ,
                    //                       child: Text
                    //                         (""
                    //                       )
                    //                       ,
                    //                       width: 10
                    //                       ,
                    //                       decoration: BoxDecoration
                    //                         (
                    //                           color: Color
                    //                             (0xffEA5353)
                    //                           ,
                    //                           borderRadius: BorderRadius.circular(5
                    //                           )
                    //                       )
                    //                       ,
                    //                     )
                    //                     ,
                    //                     Expanded
                    //                       (
                    //                         child: Padding
                    //                           (
                    //                           padding: const EdgeInsets.all(10.0
                    //                           )
                    //                           ,
                    //                           child: Text
                    //                             (
                    //                             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu. dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam
                    //                             "
                    //                             ,
                    //                             style: TextStyle
                    //                               (
                    //                               fontSize: 17,
                    //                             ),
                    //                           ),
                    //                         )),
                    //                   ],
                    //                 )
                    //                 ,
                    //               )
                    //               ,
                    //             )
                    //             ,
                    //             widget.document.get('role') == "teacher" ?
                    //             Row
                    //               (
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   MaterialButton
                    //                     (
                    //                       padding: EdgeInsets.symmetric(vertical: 2.0
                    //                           ,
                    //                           horizontal: 12
                    //                       )
                    //                       ,
                    //                       onPressed: () {
                    //                         Addannouncemnet(context);
                    //                       },
                    //                       color: Color
                    //                         (0xffEEEEEE)
                    //                       ,
                    //                       shape: RoundedRectangleBorder
                    //                         (
                    //                           borderRadius: BorderRadius.circular(8
                    //                           )
                    //                       )
                    //                       ,
                    //                       child: Text
                    //                         ("Add Announcement
                    //                       "
                    //                         ,
                    //                         style: TextStyle
                    //                           (
                    //                             color: Color
                    //                               (0xffEA5353)
                    //                             ,
                    //                             fontSize: 17
                    //                         )
                    //                         ,
                    //                       )
                    //                   )
                    //                   ,
                    //                 ]
                    //             )
                    //                 :
                    //             Text
                    //               ("")
                    //           ],
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
