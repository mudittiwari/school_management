// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("ANNOUNCEMENT"),
        centerTitle: true,
        backgroundColor: Color(0xff342F2F),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0),
              child: ListView(
                children: [
                  Padding(
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
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu. dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam",
                            style: TextStyle(
                                fontSize: 17,
                            ),
                          ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam urna aliquet eu in volutpat tempus. Amet lacus in duis a, eu. dolor sit amet, consectetur adipiscing elit. Facilisi elit, libero, aliquam",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
