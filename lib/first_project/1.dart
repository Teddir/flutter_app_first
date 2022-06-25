// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Teddi Welcome To Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Center(child: JudulResponsive(text: 'Hello Teddi')),
      ),
    );
  }
}

class Judul extends StatelessWidget {
  final String text;

  Judul({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class JudulResponsive extends StatefulWidget {
  final String text;
  const JudulResponsive({required this.text, Key? key}) : super(key: key);
  @override
  State<JudulResponsive> createState() => JudulResponsiveState();
}

class JudulResponsiveState extends State<JudulResponsive> {
  double newFontSizeText = 12;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: TextStyle(
              fontSize: newFontSizeText,
              color: newFontSizeText < 32 ? Colors.black : Colors.pink),
        ),
        ElevatedButton(
          child: Text("Click Me"),
          onPressed: () {
            setState(() {
              newFontSizeText = newFontSizeText < 32 ? 32 : 12;
            });
          },
        ),
      ],
    );
  }
}
