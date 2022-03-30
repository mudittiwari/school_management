

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("NOTICE"),
        centerTitle: true,
        backgroundColor: Color(0xff342F2F),
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 0),
            child: ListView(
              children: [
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffC4C4C4)
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 0),
                        child: Text("Subject",style: TextStyle(
                            color: Color(0xffEA5353),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),

                      Text("tLorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, facilisis in velit semper luctus. Iaculis consequat velit risus massa ut at a.")
                    ],),
                  ),
                  trailing: Icon(Icons.edit),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(height: 2,color: Color(0xffB6B0B0),),
                ),
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffC4C4C4)
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 0),
                          child: Text("Subject",style: TextStyle(
                            color: Color(0xffEA5353),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),

                        Text("tLorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, facilisis in velit semper luctus. Iaculis consequat velit risus massa ut at a.")
                      ],),
                  ),
                  trailing: Icon(Icons.edit),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(height: 2,color: Color(0xffB6B0B0),),
                ),
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffC4C4C4)
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 0),
                          child: Text("Subject",style: TextStyle(
                            color: Color(0xffEA5353),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),

                        Text("tLorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, facilisis in velit semper luctus. Iaculis consequat velit risus massa ut at a.")
                      ],),
                  ),
                  trailing: Icon(Icons.edit),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(height: 2,color: Color(0xffB6B0B0),),
                ),
                ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffC4C4C4)
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 0),
                          child: Text("Subject",style: TextStyle(
                            color: Color(0xffEA5353),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),

                        Text("tLorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, facilisis in velit semper luctus. Iaculis consequat velit risus massa ut at a.")
                      ],),
                  ),
                  trailing: Icon(Icons.edit),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(height: 2,color: Color(0xffB6B0B0),),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
