// ignore_for_file: prefer_const_constructors

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Student.dart';

class Students extends StatefulWidget {
  DocumentSnapshot document;
  Students(this.document, {Key? key}) : super(key: key);
  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  Future<QuerySnapshot> getstudents() async{
    return await FirebaseFirestore.instance.collection('student').get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff342F2F),
        title: Text("Students"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getstudents(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              // ignore: prefer_const_constructors
              return Center(child: CircularProgressIndicator(),);
            }
          else if(snapshot.hasError)
            {
              return Center(child: Icon(Icons.error),);
            }
          else
            {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Student(snapshot.data?.docs[index])));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffC4C4C4)
                              ),
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("Name:"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(snapshot.data?.docs[index].get('name')),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("Roll no:"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(snapshot.data?.docs[index].get('rollno')),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("Class:"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(snapshot.data?.docs[index].get('class')),
                                          ),
                                        ],
                                      ),
                                    ),
//                                  Text(snapshot.data?.docs[index].get('rollno')),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                ],
              );
            }
        },
      ),
    );
  }
}
