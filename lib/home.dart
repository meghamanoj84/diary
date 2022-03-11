// ignore: avoid_web_libraries_in_flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'addNote.dart';

class Homepage extends StatefulWidget{
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<Homepage>{

  final ref = FirebaseFirestore.instance.collection('notes');
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome back...'),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNote()));
      },),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
              itemBuilder: (_,index){
            return Container(
              margin: EdgeInsets.all(20),
              height: 150,
              color: Colors.tealAccent,
              child: Column(
                children: [
                  Text(snapshot.data?.docs[index].get('date')),
                  Text(snapshot.data?.docs[index].get('content')),
                ],
              ),

            );
              });
        }
      ),
    );
  }
}