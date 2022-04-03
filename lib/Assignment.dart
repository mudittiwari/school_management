// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'Announcement.dart';
import 'Attendence.dart';
import 'Notice.dart';

class Assignment extends StatefulWidget {
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  String active = "completed";
  Color rcolor = Color(0xffEEEEEE);
  Color ccolor = Color(0xffEA5353);
  Color rtext = Colors.black;
  Color ctext = Colors.white;

  Widget mainwidget() {
    if (active == "completed") {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Color(0xffD7D4D4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Submitted on: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "10-10-2020",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            "Subject: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu.",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Color(0xffD7D4D4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Submitted on: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "10-10-2020",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            "Subject: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu.",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Color(0xffD7D4D4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Submitted on: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "10-10-2020",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            "Subject: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu.",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Color(0xffD7D4D4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Due Date: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "10-10-2020",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            "Subject: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu.",
                          style: TextStyle(fontSize: 16),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Upload Assignment",
                              style: TextStyle(color: Color(0xffEA5353)),
                            ),
                            color: Color(0xffF3F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                            color: Color(0xffF3F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Color(0xffD7D4D4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Due Date: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "10-10-2020",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            "Subject: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu.",
                          style: TextStyle(fontSize: 16),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Upload Assignment",
                              style: TextStyle(color: Color(0xffEA5353)),
                            ),
                            color: Color(0xffF3F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                            color: Color(0xffF3F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    color: Color(0xffD7D4D4),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Due Date: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "10-10-2020",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            "Subject: ",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Color(0xffEA5353), fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu.",
                          style: TextStyle(fontSize: 16),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Upload Assignment",
                              style: TextStyle(color: Color(0xffEA5353)),
                            ),
                            color: Color(0xffF3F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                            color: Color(0xffF3F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          if (active != "completed") {
            active = "completed";
            rcolor = Color(0xffEEEEEE);
            ccolor = Color(0xffEA5353);
            rtext = Colors.black;
            ctext = Colors.white;
            setState(() {});
          }
        } else if (details.primaryVelocity! < 0) {
          if (active != "passed") {
//            print("tiwari");
            active = "remaining";
            rcolor = Color(0xffEA5353);
            ccolor = Color(0xffEEEEEE);
            ctext = Colors.black;
            rtext = Colors.white;
            setState(() {});
          }
        }
      },
      child: Scaffold(
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
                  onPressed: () => {},
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Attendence()))
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
                  onPressed: () => {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
                  onPressed: () => {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
                  onPressed: () => {},
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Notice()))
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Announcement()))
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                child: Divider(
                  height: 2,
                  color: Colors.white,
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Center(
                child: Container(
                  width: 260,
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 40,
                        color: ccolor,
                        child: Center(
                            child: Text(
                          "Completed",
                          style: TextStyle(color: ctext, fontSize: 16),
                        )),
                      )),
                      Expanded(
                          child: Container(
                        height: 40,
                        color: rcolor,
                        child: Center(
                            child: Text("Remaining",
                                style: TextStyle(color: rtext, fontSize: 16))),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: mainwidget()),
          ],
        ),
      ),
    );
  }
}
