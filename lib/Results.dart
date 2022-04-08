// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Homepage.dart';
import 'package:school_management/searchres.dart';

import 'Announcement.dart';
import 'Assignment.dart';
import 'Attendence.dart';
import 'Notice.dart';
import 'Searchatten.dart';

class Results extends StatefulWidget {
  DocumentSnapshot document;

  Results(this.document, {Key? key}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  List<Map<String, List<TextEditingController>>> lst = [];
  late Future<QuerySnapshot> students_;

  Future<QuerySnapshot> getstudents() async {
    return await FirebaseFirestore.instance
        .collection('student')
        .where('class', isEqualTo: widget.document.get('class'))
        .get();
  }

  TextEditingController examination = TextEditingController();
  late Future<QuerySnapshot> results_;
  bool searched = false;

  Future<QuerySnapshot> getresluts() async {
    return FirebaseFirestore.instance.collection('student').get();
  }

  @override
  void initState() {
    students_ = getstudents();
    results_ = getresluts();
    super.initState();
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

  Widget Student() {
    return SingleChildScrollView(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                              controller: examination,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "examination name"),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  searched = true;
                                  setState(() {});
//                    result=getresult();
                                },
                                icon: Icon(Icons.search)))
                      ],
                    ),
                  ),
                ),
                Row(
//                    shrinkWrap: true,
//                    scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      width: 160,
//                  color: Colors.blue,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Roll No.",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      width: 160,
//                  color: Colors.blue,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Examination Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      width: 160,
//                  color: Colors.blue,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Mathematics",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      width: 160,
//                  color: Colors.blue,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "English",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      width: 160,
//                  color: Colors.blue,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Hindi",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      width: 160,
//                  color: Colors.blue,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Social Studies",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      width: 160,
//                  color: Colors.blue,
                    ),
                  ],
                ),
                FutureBuilder(
                  future: results_,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Icon(Icons.error),
                      );
                    } else if (searched) {
                      return Container(
                        width: 1120,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (snapshot.data?.docs[index].get('email') ==
                                widget.document.get('email')) {
//                      Map<String,String> mp={};
//                    print(widget.document.get('email'));
                              return Row(
                                children: [
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                              .get('name')))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                              .get('rollno')))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child:
                                              Text(examination.text.trim()))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                                  .get('result')[
                                              examination.text.trim()][0]))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                                  .get('result')[
                                              examination.text.trim()][1]))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                                  .get('result')[
                                              examination.text.trim()][2]))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                                  .get('result')[
                                              examination.text.trim()][3]))),
                                ],
                              );
                            }
                            return Text("");
                          },
                          itemCount: snapshot.data?.docs.length,
                        ),
                      );
                    } else {
                      return Text("");
                    }
                  },
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget Teacher() {
    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: SingleChildScrollView(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          children:[ Flexible(
             child: SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 1120,
                    height: 30,
                    child: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "Name",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          width: 160,
//                  color: Colors.blue,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Roll No.",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          width: 160,
//                  color: Colors.blue,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Examination Name",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          width: 160,
//                  color: Colors.blue,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Mathematics",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          width: 160,
//                  color: Colors.blue,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "English",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          width: 160,
//                  color: Colors.blue,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Hindi",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          width: 160,
//                  color: Colors.blue,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Social Studies",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          width: 160,
//                  color: Colors.blue,
                        ),

//
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: students_,
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
                        int? i = snapshot.data?.docs.length;
//                print(i);
                        if (i != null) {
                          for (int j = 0; j < i; j++) {
                            Map<String, List<TextEditingController>> mp = {
                              snapshot.data?.docs[j].get('email'): [
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController()
                              ]
                            };
                            lst.add(mp);
                          }
                        }

                        return Container(
                          width: 1120,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                              .get('name')))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Text(snapshot.data?.docs[index]
                                              .get('rollno')))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: TextField(
//                                        onChanged: (text){print(lst[index][snapshot.data?.docs[index]
//                                            .get('email')]![0].text);},
                                          controller: lst[index][snapshot
                                              .data?.docs[index]
                                              .get('email')]![0],
                                          decoration: InputDecoration(
                                              hintText: "Examination Name"),
                                        ),
                                      ))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: TextField(
                                          controller: lst[index][snapshot
                                              .data?.docs[index]
                                              .get('email')]![1],
                                          decoration:
                                              InputDecoration(hintText: "Marks"),
                                        ),
                                      ))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: TextField(
                                          controller: lst[index][snapshot
                                              .data?.docs[index]
                                              .get('email')]![2],
                                          decoration:
                                              InputDecoration(hintText: "Marks"),
                                        ),
                                      ))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: TextField(
                                          controller: lst[index][snapshot
                                              .data?.docs[index]
                                              .get('email')]![3],
                                          decoration:
                                              InputDecoration(hintText: "Marks"),
                                        ),
                                      ))),
                                  Container(
                                      width: 160,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: TextField(
                                          controller: lst[index][snapshot
                                              .data?.docs[index]
                                              .get('email')]![4],
                                          decoration:
                                              InputDecoration(hintText: "Marks"),
                                        ),
                                      ))),
                                ],
                              );
                            },
                          ),
                        );
                      }
                    },
                  )
                ],
          ),
             ),
           ),
      ]
        ),
      ),
    );
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
          ])),
      appBar: AppBar(
        backgroundColor: Color(0xff342F2F),
        title: Text("Results"),
        centerTitle: true,
      ),
      body: widget.document.get("role") == "teacher" ? Teacher() : Student(),
      floatingActionButton: widget.document.get('role') == 'teacher'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xff342F2F)),
                    child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        color: Colors.white,
                        icon: Icon(Icons.done),
                        onPressed: () async {
//            var students;

                          showLoaderDialog(context);
                          List<QueryDocumentSnapshot> students = [];
                          await FirebaseFirestore.instance
                              .collection('student')
                              .where('class',
                                  isEqualTo: widget.document.get('class'))
                              .get()
                              .then((value) async {
                            if (value.docs.isNotEmpty) {
                              students = value.docs;
                            }
                          });
//            print(lst[0]["mudit.alwar13@gmail.com"]![0].text);
                          for (int i = 0; i < students.length; i++) {
                            List<TextEditingController>? student_res;
                            for (int j = 0; j < lst.length; j++) {
                              if (lst[j]
                                  .containsKey(students[i].get('email'))) {
//                                  print(lst[j][students[i].get('email')]![0].text);
////                            print("mudit");
                                student_res = lst[j][students[i].get('email')];
                                break;
                              }
                            }
//                    if(student_atten!=null)

                            var id_ = students[i].id;
                            DateTime now = DateTime.now();
                            DateTime date =
                                DateTime(now.year, now.month, now.day);
//                    print(date.day);
//                    print(date.month);
                            Map<String, dynamic> res =
                                students[i].get('result');
                            List<String> result = [];
                            if (student_res != null) {
                              for (int j = 1; j < student_res.length; j++) {
                                result.add(student_res[j].text);
                              }
                            }
//                    print(result);
                            if (student_res != null) {
                              res[student_res[0].text] = result;
                            }
                            print(res);
//                      print(examination.text);
                            await FirebaseFirestore.instance
                                .collection('student')
                                .doc(id_)
                                .update({'result': res});
                          }
                          Navigator.pop(context);
                        }
//          },
                        ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff342F2F)),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.white,
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  searchres(widget.document)));
                    },
                  ),
                ),
              ],
            )
          : Text(""),
    );
  }
}
