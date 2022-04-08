// ignore_for_file: prefer_const_constructors

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class searchres extends StatefulWidget {
  DocumentSnapshot document;
  searchres(this.document, {Key? key}) : super(key: key);
  @override
  _searchresState createState() => _searchresState();
}

class _searchresState extends State<searchres> {
  TextEditingController examination=TextEditingController();
  late Future<QuerySnapshot> res;
  bool searched=false;
  Future<QuerySnapshot> getres()
  async {

    return FirebaseFirestore.instance.collection('student').where('class',isEqualTo: widget.document.get('class')).get();
  }
  @override
  void initState()
  {
    res=getres();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        title: Text("Result"),
        centerTitle: true,
        backgroundColor: Color(0xff342F2F),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex:5,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextField(
                                  controller: examination,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Examination Name"
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex:1,child: IconButton(onPressed: (){
                              searched=true;
                              setState(() {

                              });
//                    atten_=getatten();
                            }, icon: Icon(Icons.search)))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1120-160,
                      height: 30,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
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
                    ),
                    FutureBuilder(
                      future: res,
                      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                        if(snapshot.connectionState==ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        else if(snapshot.hasError)
                        {
                          return Center(child: Icon(Icons.error),);
                        }
                        else if(searched)
                        {
                          return Container(
                            width: 1120-160,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context,index)
                              {
                                return Row(
                                  children: [
                                    Container(
                                        width:160,
                                        child: Center(
                                            child: Text(snapshot.data?.docs[index]
                                                .get('name')))),
                                    Container(
                                        width:160,
                                        child: Center(
                                            child: Text(snapshot.data?.docs[index]
                                                .get('rollno')))),
                                    Container(
                                        width:160,
                                        child:  Center(
                                            child: Text(snapshot.data?.docs[index]
                                                .get('result')[examination.text.trim()][0]))),
                                    Container(
                                        width:160,
                                        child:  Center(
                                            child: Text(snapshot.data?.docs[index]
                                                .get('result')[examination.text.trim()][1]))),
                                    Container(
                                        width:160,
                                        child:  Center(
                                            child: Text(snapshot.data?.docs[index]
                                                .get('result')[examination.text.trim()][2]))),
                                    Container(
                                        width:160,
                                        child:  Center(
                                            child: Text(snapshot.data?.docs[index]
                                                .get('result')[examination.text.trim()][3]))),
                                  ],
                                );
                              },
                              itemCount: snapshot.data?.docs.length,
                            ),
                          );
                        }
                        else
                        {
                          return Text("");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
