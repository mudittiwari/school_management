// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Student extends StatefulWidget {
  QueryDocumentSnapshot? document;

  Student(this.document, {Key? key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  int start = 0;
  int present = 0;
  int total = 0;
  late double percent_present;
  List<MapEntry<String, int>> absent = [];
  @override
  void initState()
  {
    super.initState();
    widget.document?.get('atten').forEach((key, value) {
//                                      print("muidt");
//                                print(key);
//                                print(value);
      for (int i = 0; i < value.length; i++) {
        if (value[i] == "P" ||
            value[i] == "p" ||
            value[i] == "present") {
//                                      print("muidt");
          present++;
        } else {
//                                      print("muidtttt");
          absent.add(MapEntry(key, i));
        }
        total++;
      }
    });
    percent_present = (present / total) * 100;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff342F2F),
        title: Text('Student'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Name:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.document?.get('name'),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Father's Name:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.document?.get('father'),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Mobile no:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.document?.get('mobno'),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Class:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.document?.get('class'),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  "Results",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 500,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
//                        print(widget.document?.get('result').keys.length);
                        if (index == 0) {
                          start = 1;
                          Map<String, List<int>> mp = {};

                          return Row(
                            children: [
                              Container(
                                  width: 120,
                                  height: 40,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Subjects",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  )),
                              Container(
//                                width: 60,
                                height: 40,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.document
                                      ?.get('result')
                                      .keys
                                      .length,
                                  itemBuilder: (context, ind) {
                                    return Container(
                                      width: 100,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8),
                                          child: Text(
                                              '${widget.document?.get('result').keys.elementAt(ind).toString()}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width: 120,
                                      height: 40,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Mathematics",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    height: 40,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: widget.document
                                          ?.get('result')
                                          .keys
                                          .length,
                                      itemBuilder: (context, ind) {
//                                        print();
                                        return Container(
                                          width: 100,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Text(
                                                  '${widget.document?.get('result')[widget.document?.get('result').keys.elementAt(ind)][0]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                            ),
                                          ),
                                        );
                                      },
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 120,
                                      height: 40,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "English",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    height: 40,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: widget.document
                                          ?.get('result')
                                          .keys
                                          .length,
                                      itemBuilder: (context, ind) {
//                                        print();
                                        return Container(
                                          width: 100,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Text(
                                                  '${widget.document?.get('result')[widget.document?.get('result').keys.elementAt(ind)][1]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                            ),
                                          ),
                                        );
                                      },
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 120,
                                      height: 40,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Hindi",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    height: 40,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: widget.document
                                          ?.get('result')
                                          .keys
                                          .length,
                                      itemBuilder: (context, ind) {
//                                        print();
                                        return Container(
                                          width: 100,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Text(
                                                  '${widget.document?.get('result')[widget.document?.get('result').keys.elementAt(ind)][2]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                            ),
                                          ),
                                        );
                                      },
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 120,
                                      height: 40,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Social St.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    height: 40,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: widget.document
                                          ?.get('result')
                                          .keys
                                          .length,
                                      itemBuilder: (context, ind) {
//                                        print();
                                        return Container(
                                          width: 100,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Text(
                                                  '${widget.document?.get('result')[widget.document?.get('result').keys.elementAt(ind)][3]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16)),
                                            ),
                                          ),
                                        );
                                      },
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        }
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  "Attendence",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
//                          Image(image: AssetImage("assets/images/present.png")),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "${percent_present.toString()}% Present",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
//                          Image(image: AssetImage("assets/images/absent.png")),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "${(100 - percent_present).toString()}% Absent",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  "Absent Details",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 0),
                      child: Center(
                        child: Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 0),
                      child: Center(
                        child: Text(
                          "Subject",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width -
                32,
                child: ListView.builder(
                shrinkWrap: true,
//                                        physics: NeverScrollableScrollPhysics(),
                itemCount: absent.length,
                itemBuilder: (context, index) {
                  return Row(
//                                            crossAxisAlignment: CrossAxisAlignment.start,
//                                            mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets
                                    .symmetric(
                                vertical: 14.0),
                            child: Text(
                              absent[index].key,
//                                                  textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets
                                    .symmetric(
                                vertical: 14.0),
                            child: absent[index]
                                        .value ==
                                    0
                                ? Text(
                                    "Mathematics",
//                                                        textAlign:
//                                                            TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18),
                                  )
                                : (absent[index]
                                            .value ==
                                        1
                                    ? Text(
                                        "English",
//                                                            textAlign: TextAlign
//                                                                .center,
                                        style: TextStyle(
                                            fontSize:
                                                18),
                                      )
                                    : absent[index]
                                                .value ==
                                            2
                                        ? Text(
                                            "Hindi",
//                                                                textAlign:
//                                                                    TextAlign
//                                                                        .center,
                                            style: TextStyle(
                                                fontSize:
                                                    18),
                                          )
                                        : Text(
                                            "Social Studies",
//                                                                textAlign:
//                                                                    TextAlign
//                                                                        .center,
                                            style: TextStyle(
                                                fontSize:
                                                    18),
                                          )),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
