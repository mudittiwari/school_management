// ignore_for_file: prefer_const_constructors

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
  TextEditingController date=TextEditingController();
  late Future<QuerySnapshot> atten_;
  bool searched=false;
  Future<QuerySnapshot> getatten()
 async {

    return FirebaseFirestore.instance.collection('student').where('class',isEqualTo: widget.document.get('class')).get();
  }
  @override
  void initState()
  {
    atten_=getatten();
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
                                  controller: date,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "type date"
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
                      future: atten_,
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

                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
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
                                                  .get('atten')[date.text.trim()][0]))),
                                    Container(
                                        width:160,
                                        child:  Center(
                                            child: Text(snapshot.data?.docs[index]
                                                .get('atten')[date.text.trim()][1]))),
                                      Container(
                                          width:160,
                                          child:  Center(
                                              child: Text(snapshot.data?.docs[index]
                                                  .get('atten')[date.text.trim()][2]))),
                                      Container(
                                          width:160,
                                          child:  Center(
                                              child: Text(snapshot.data?.docs[index]
                                                  .get('atten')[date.text.trim()][3]))),
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
