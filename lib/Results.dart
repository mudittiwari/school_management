// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Homepage.dart';

import 'Announcement.dart';
import 'Assignment.dart';
import 'Attendence.dart';
import 'Notice.dart';

class Results extends StatefulWidget {
  DocumentSnapshot document;
  Results(this.document, {Key? key}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage(widget.document)))
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Attendence(widget.document)))
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
                      MaterialPageRoute(builder: (context) => Assignment(widget.document)))
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
                      MaterialPageRoute(builder: (context) => Results(widget.document)))
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notice(widget.document)))
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
                      MaterialPageRoute(builder: (context) => Announcement(widget.document)))
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          hintText: "Exam Name"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "Roll No."),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "DD/MM/YYYY"),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4),
                      child: Container(
                        height: 47,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .5,
//            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.black))),
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Exam Name",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffEA5353)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .45,
                            child: ListView(
//                            physics: NeverScrollableScrollPhysics(),
//                            shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.black))),
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Subject",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffEA5353)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .45,
                            child: ListView(
//                            physics: NeverScrollableScrollPhysics(),
//                            shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "Maths",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.black))),
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Grade",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffEA5353)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .45,
                            child: ListView(
//                            physics: NeverScrollableScrollPhysics(),
//                            shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "A",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.black))),
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Percent",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffEA5353)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .45,
                            child: ListView(
//                            physics: NeverScrollableScrollPhysics(),
//                            shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "0%",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Date",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffEA5353)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .45,
                            child: ListView(
//                            physics: NeverScrollableScrollPhysics(),
//                            shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                      child: Text(
                                    "00/00/0000",
                                    style: TextStyle(fontSize: 17),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
//            child: Row(
//              children: [
//                Expanded(
//                    flex: 1,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          border: Border(
//                              right:
//                                  BorderSide(width: 1, color: Colors.black))),
//                      child: Padding(
//                        padding: const EdgeInsets.all(4.0),
//                        child: Column(
//                          children: [
//                            SingleChildScrollView(
//                              scrollDirection: Axis.horizontal,
//                              child: Text(
//                                "Exam Name",
//                                style: TextStyle(
//                                    color: Color(0xffEA5353), fontSize: 16),
//                              ),
//                            ),
//                            Container(
//                              child: ListView(
//                                physics: NeverScrollableScrollPhysics(),
//                                shrinkWrap: true,
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("mathsisagood",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    )),
//                Expanded(
//                    flex: 1,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          border: Border(
//                              right:
//                                  BorderSide(width: 1, color: Colors.black))),
//                      child: Padding(
//                        padding: const EdgeInsets.all(4.0),
//                        child: Column(
//                          children: [
//                            SingleChildScrollView(
//                              scrollDirection: Axis.horizontal,
//                              child: Text(
//                                "Subject",
//                                style: TextStyle(
//                                    color: Color(0xffEA5353), fontSize: 16),
//                              ),
//                            ),
//                            Container(
//                              child: ListView(
//                                physics: NeverScrollableScrollPhysics(),
//                                shrinkWrap: true,
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("mathsisagood",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    )),
//                Expanded(
//                    flex: 1,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          border: Border(
//                              right:
//                                  BorderSide(width: 1, color: Colors.black))),
//                      child: Padding(
//                        padding: const EdgeInsets.all(4.0),
//                        child: Column(
//                          children: [
//                            SingleChildScrollView(
//                              scrollDirection: Axis.horizontal,
//                              child: Text(
//                                "Grade",
//                                style: TextStyle(
//                                    color: Color(0xffEA5353), fontSize: 16),
//                              ),
//                            ),
//                            Container(
//                              child: ListView(
//                                physics: NeverScrollableScrollPhysics(),
//                                shrinkWrap: true,
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("mathsisagood",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    )),
//                Expanded(
//                    flex: 1,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          border: Border(
//                              right:
//                                  BorderSide(width: 1, color: Colors.black))),
//                      child: Padding(
//                        padding: const EdgeInsets.all(4.0),
//                        child: Column(
//                          children: [
//                            SingleChildScrollView(
//                              scrollDirection: Axis.horizontal,
//                              child: Text(
//                                "Percent",
//                                style: TextStyle(
//                                    color: Color(0xffEA5353), fontSize: 16),
//                              ),
//                            ),
//                            Container(
//                              child: ListView(
//                                physics: NeverScrollableScrollPhysics(),
//                                shrinkWrap: true,
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("mathsisagood",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    )),
//                Expanded(
//                    flex: 1,
//                    child: Container(
//                      child: Padding(
//                        padding: const EdgeInsets.all(4.0),
//                        child: Column(
//                          children: [
//                            SingleChildScrollView(
//                              scrollDirection: Axis.horizontal,
//                              child: Text(
//                                "Date",
//                                style: TextStyle(
//                                    color: Color(0xffEA5353), fontSize: 16),
//                              ),
//                            ),
//                            Container(
//                              child: ListView(
//                                physics: NeverScrollableScrollPhysics(),
//                                shrinkWrap: true,
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("mathsisagood",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.symmetric(
//                                        vertical: 2.0),
//                                    child: Center(
//                                      child: SingleChildScrollView(
//                                        scrollDirection: Axis.horizontal,
//                                        child: Text("abcd",
//                                            style: TextStyle(fontSize: 15)),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    )),
//              ],
//            ),
          )
        ],
      ),
    );
  }
}
