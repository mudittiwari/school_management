// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Teachers extends StatefulWidget {
  DocumentSnapshot document;
  Teachers(this.document, {Key? key}) : super(key: key);
  @override
  _TeachersState createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {

  Future<QuerySnapshot> getteachers()
  async{
    return await FirebaseFirestore.instance.collection('teacher').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff342F2F),
          title: Text("Teachers"),
          centerTitle: true,
        ),
      body: FutureBuilder(
        future: getteachers(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError) {
            return Center(child: Icon(Icons.error),);
          }
          else
            {
//              var len;
//              if(snapshot.data?.docs.length!=null)
//                {
//                  len=snapshot.data?.docs.length;
//                }
//              if(len%2==0)
//                {
//                  len=(len/2).toInt();
//                }
//              else
//                {
//                  len=(len/2).toInt()+1;
//                }
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 0),
                      child: GridView.builder(

                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (MediaQuery.of(context).size.width/2)/250,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0
              ),
                      itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
//                                height: 800,

//                                width: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xff342F2F)
                                  ),
                                  child: Column(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: AssetImage("assets/images/teacher.png"),width: 100,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 0),
                                        child: Text('${snapshot.data?.docs[index].get('name').toString()}',style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 0),
                                        child: Text('${snapshot.data?.docs[index].get('email').toString()}',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 0),
                                        child: Text('${snapshot.data?.docs[index].get('mobno').toString()}',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 0),
                                        child: Text('${snapshot.data?.docs[index].get('class').toString()}',style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),

                              )),

                            ],
                          );
                        }),
                    ),
                  ),

                ],
              );
            }
        },
      )
    );
  }
}
