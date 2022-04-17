// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class searchatten extends StatefulWidget {
  DocumentSnapshot document;

  searchatten(this.document, {Key? key}) : super(key: key);

  @override
  _searchattenState createState() => _searchattenState();
}

class _searchattenState extends State<searchatten> {
  TextEditingController date = TextEditingController();
  late Future<QuerySnapshot> atten_;
  bool searched = false;

  Future<QuerySnapshot> getatten() async {
    return FirebaseFirestore.instance
        .collection('student')
        .where('class', isEqualTo: widget.document.get('class'))
        .get();
  }

  @override
  void initState() {
    atten_ = getatten();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        title: Text("ATTENDENCE"),
        centerTitle: true,
        backgroundColor: Color(0xff342F2F),
      ),
      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                        controller: date,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "type roll no"),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            searched = true;
                            setState(() {});
//                    atten_=getatten();
                          },
                          icon: Icon(Icons.search)))
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: atten_,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Icon(Icons.error),
                  );
                } else if (searched) {
                  int present = 0;
                  int total = 0;
                  List<MapEntry<String, int>> absent = [];
                  var len = snapshot.data?.docs.length;
                  int j = 0;
                  if (len != null) j = len;
                  for (int k = 0; k < j; k++) {
                    if (snapshot.data?.docs[k].get('rollno') ==
                        date.text.trim()) {
//                                Map<String, List<String>> mp = {};
//                                mp.forEach((key, value) {
//                                  for (int i = 0; i < value.length; i++) {}
//                                });
                      snapshot.data?.docs[k].get('atten').forEach((key, value) {
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
                      double percent_present = (present / total) * 100;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Column(
                          children: [
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
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                flex:1,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 8.0, horizontal: 0),
                                                  child: Center(
                                                    child: Text(
                                                      "Date",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold),
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
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                              child: Container(
                                                width:
                                                MediaQuery.of(context).size.width - 32,
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
                                                            flex:1,
                                                            child: Center(
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsets.symmetric(
                                                                    vertical: 14.0),
                                                                child: Text(
                                                                  absent[index].key,
//                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                  TextStyle(fontSize: 18),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          Expanded(
                                                            flex:1,
                                                            child: Center(
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsets.symmetric(
                                                                    vertical: 14.0),
                                                                child: absent[index].value == 0
                                                                    ? Text(
                                                                  "Mathematics",
//                                                        textAlign:
//                                                            TextAlign.center,
                                                                  style: TextStyle(
                                                                      fontSize: 18),
                                                                )
                                                                    : (absent[index].value == 1
                                                                    ? Text(
                                                                  "English",
//                                                            textAlign: TextAlign
//                                                                .center,
                                                                  style: TextStyle(
                                                                      fontSize: 18),
                                                                )
                                                                    : absent[index].value ==
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
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),

//                          Text("Date",style: TextStyle(
//                            fontSize: 18
//                          ),),
//                          Text("Subject",style: TextStyle(
//                            fontSize: 18
//                          ),)
                                ],
                              ),
                            ),
//                    Expanded(
//                        child: ListView.builder(
//                            itemCount: absent.length,
//                            itemBuilder: (context, index) {
//                              return Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceAround,
//                                children: [
//                                  Text(
//                                    absent[index].key,
//                                    style: TextStyle(fontSize: 18),
//                                  ),
//                                  Text(
//                                    absent[index].value.toString(),
//                                    style: TextStyle(fontSize: 18),
//                                  )
//                                ],
//                              );
//                            })),
                          ],
                        ),
                      );
                    }
                  }
                  return Text("");
                } else {
                  return Text("");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
