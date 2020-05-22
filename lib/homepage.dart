import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String phoneNo = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: new StreamBuilder(
          stream: Firestore.instance
              .collection('users')
              .document(phoneNo)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading");
            }
            var userDocument = snapshot.data;
            return new Text('hello'+ userDocument["name"]);
          }),
    );
  }
}
