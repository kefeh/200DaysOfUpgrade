import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I am flame',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "I am Flame",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/fire.png"),
            height: 200,
            width: 200,
          ),
        ),
        backgroundColor: Color.fromRGBO(21, 19, 54, 1),
      ),
    );
  }
}
