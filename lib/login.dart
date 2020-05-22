import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String phoneNo;
  String errorMessage = '';
  String uid;

  void abc() {
    Navigator.of(context).pushNamed('/homepage', arguments: phoneNo);
  }

  Future<void> checkExist(String docID) async {
    bool exists = false;
    try {
      await Firestore.instance.document("users/$docID").get().then((docc) {
        if (docc.exists) {
          abc();
        } else
          _showDialog();
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Invalid user"),
          actions: <Widget>[
            FlatButton(
              child: Text('Sign up'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/signup');
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login-Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Phone Number Eg. +910000000000'),
                onChanged: (value) {
                  this.phoneNo = value;
                },
              ),
            ),
            (errorMessage != ''
                ? Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  )
                : Container()),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                checkExist(phoneNo);
              },
              child: Text('Verify'),
              textColor: Colors.white,
              elevation: 7,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
