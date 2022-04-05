// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Homepage.dart';

import 'Announcement.dart';
import 'Assignment.dart';
import 'Attendence.dart';
import 'Notice.dart';
import 'Results.dart';

class Profile extends StatefulWidget {
  DocumentSnapshot document;

  Profile(this.document, {Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          ])),
      appBar: AppBar(
        backgroundColor: Color(0xff342F2F),
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
                color: Color(0xffC4C4C4),
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(0),
                    topEnd: Radius.circular(0),
                    bottomStart: Radius.circular(36),
                    bottomEnd: Radius.circular(36))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3),
                    child: Text(
                      widget.document.get('name'),
                      style: TextStyle(fontSize: 24, color: Color(0xff342F2F)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3),
                    child: Text(
                      widget.document.get('class'),
                      style: TextStyle(fontSize: 24, color: Color(0xff342F2F)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff342F2F)),
                height: 450,
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.document.get("role") == "student"
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              height: 30,
                              color: Color(0xffEEEEEE),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Center(
                                        child: Text(
                                      "Program:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffEA5353)),
                                    )),
                                  )),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Center(
                                        child: Text("ABCD",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffEA5353)))),
                                    scrollDirection: Axis.horizontal,
                                  ))
                                ],
                              ),
                            ),
                          )
                        : Text(""),
                    widget.document.get("role") == "student"
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              height: 30,
                              color: Color(0xffEEEEEE),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: Center(
                                              child: Text(
                                    "Roll No:",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xffEA5353)),
                                  )))),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Center(
                                        child: Text(widget.document.get('rollno'),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffEA5353)))),
                                    scrollDirection: Axis.horizontal,
                                  ))
                                ],
                              ),
                            ),
                          )
                        : Text(""),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: 30,
                        color: Color(0xffEEEEEE),
                        child: Row(
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                                    child: Center(
                                        child: Text(
                              "Email:",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xffEA5353)),
                            )))),
                            Expanded(
                                child: SingleChildScrollView(
                              child: Center(
                                  child: Text(widget.document.get('email'),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffEA5353)))),
                              scrollDirection: Axis.horizontal,
                            ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: 30,
                        color: Color(0xffEEEEEE),
                        child: Row(
                          children: [
                            Expanded(
                             
                                child: SingleChildScrollView(
                                    child: Center(
                                        child: Text(
                              "Mobile:",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xffEA5353)),
                            )))),
                            Expanded(
                              
                              child: SingleChildScrollView(
                                child: Center(
                                    child: Text(widget.document.get('mobno'),
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffEA5353)))),
                                scrollDirection: Axis.horizontal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    widget.document.get("role") == "student"
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              height: 30,
                              color: Color(0xffEEEEEE),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Center(
                                        child: Text(
                                      "Guardian Name:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xffEA5353)),
                                    )),
                                    scrollDirection: Axis.horizontal,
                                  )),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Center(
                                      child: Text(widget.document.get('father'),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xffEA5353))),
                                    ),
                                    scrollDirection: Axis.horizontal,
                                  ))
                                ],
                              ),
                            ),
                          )
                        : Text(""),
                    widget.document.get("role") == "student"
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              height: 30,
                              color: Color(0xffEEEEEE),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Center(
                                      child: Text(
                                        "Guardian Mobile:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffEA5353)),
                                      ),
                                    ),
                                    scrollDirection: Axis.horizontal,
                                  )),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Center(
                                        child: Text(widget.document.get('fathermob'),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffEA5353)))),
                                    scrollDirection: Axis.horizontal,
                                  ))
                                ],
                              ),
                            ),
                          )
                        : Text(""),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
