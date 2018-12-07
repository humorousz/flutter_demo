import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Welcome to Flutter",
        home: Scaffold(
          body: Center(
            child: Text("Hello world2"),
          ),
        )
    );
  }
}