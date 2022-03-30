// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Attendence extends StatefulWidget {
  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("ATTENDENCE"),
        centerTitle: true,
        backgroundColor: Color(0xff342F2F),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Center(
                child: Image(image: AssetImage("assets/images/atten.png"))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("assets/images/present.png")),
                Text(
                  "60% present",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("assets/images/absent.png")),
                Text(
                  "40% absent",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Absent Detals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () => {},
                  child: Text("View all"),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                        "Date",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ))),
              Expanded(
                  child: Center(
                      child: Text(
                        "Day",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ))),
              Expanded(
                  child: Center(
                      child: Text(
                        "Subject",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              height: 2,
              color:Colors.black,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      "10-01-22",
                      style: TextStyle(fontSize: 18),
                    ))),
                    Expanded(
                        child: Center(
                            child: Text(
                      "Monday",
                      style: TextStyle(fontSize: 18,),
                    ))),
                    Expanded(
                        child: Center(
                            child: Text(
                      "English",
                      style: TextStyle(fontSize: 18,),
                    ))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                              "10-01-22",
                              style: TextStyle(fontSize: 18),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "Monday",
                              style: TextStyle(fontSize: 18,),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "English",
                              style: TextStyle(fontSize: 18,),
                            ))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                              "10-01-22",
                              style: TextStyle(fontSize: 18),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "Monday",
                              style: TextStyle(fontSize: 18,),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "English",
                              style: TextStyle(fontSize: 18,),
                            ))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                              "10-01-22",
                              style: TextStyle(fontSize: 18),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "Monday",
                              style: TextStyle(fontSize: 18,),
                            ))),
                    Expanded(
                        child: Center(
                            child: Text(
                              "English",
                              style: TextStyle(fontSize: 18,),
                            ))),
                  ],
                ),
              ),


            ],
          )),
        ],
      ),
    );
  }
}
