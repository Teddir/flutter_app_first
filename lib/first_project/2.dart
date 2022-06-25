// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => YourApp1();
}

class YourApp1 extends State<MyApp> {
  dynamic click = 0;
  dynamic status = '';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello Teddi Welcome To Flutter',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              title: Text('Tokorame'),
            ),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              child: Container(height: 50.0),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'click ae lah',
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  if (click == 20) {
                    status = 'max';
                  } else {
                    status = '';
                    click = click += 1;
                  }
                });
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.home),
                          Icon(Icons.thumb_up),
                          Icon(Icons.thumb_down),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Sebuah Judul',
                            style: TextStyle(fontSize: 32),
                          ),
                          Text('Kamu')
                        ],
                      ),
                    )
                  ],
                ))));
  }
}

class YourApp extends State<MyApp> {
  dynamic click = 0;
  dynamic status = '';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello Teddi Welcome To Flutter',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            title: Text('Tokorame'),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Container(height: 50.0),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'click ae lah',
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                if (click == 20) {
                  status = 'max';
                } else {
                  status = '';
                  click = click += 1;
                }
              });
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Center(
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(73, 236, 74, 128),
                        offset: Offset(3, 6),
                        blurRadius: 6,
                      ),
                    ],
                    border: Border.all(color: Colors.pink, width: 1),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Hello Teddi ',
                    style: TextStyle(fontSize: 12),
                  ),
                )),
          ),
        ));
  }
}
