import 'package:flutter/material.dart';
import 'login.dart';
import 'homepage.dart';
import 'sign_in_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Authentication',
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => MyHomePage(),
        '/loginpage': (BuildContext context) => Login(),
        '/signup':(BuildContext context) => MyAppPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

