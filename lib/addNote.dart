import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNote extends StatelessWidget{

  TextEditingController date = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(onPressed: () {
            ref.add({
              'date': date.text,
              'content': content.text,
            }).whenComplete(()=> Navigator.pop(context));
          }, child: Text('Save'))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: date,
                decoration: InputDecoration(hintText: 'Date'),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Content'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}