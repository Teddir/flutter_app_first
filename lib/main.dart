import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bali',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const ListColor(),
    );
  }
}

// responsive with expanded & Flexible
class ListColor extends StatefulWidget {
  const ListColor({Key? key}) : super(key: key);
  @override
  ListColorState createState() => ListColorState();
}

class ListColorState extends State<ListColor> {
  final List myColor = [
    {"colorCode": Colors.pink, "name": "pink"},
    {"colorCode": Colors.red, "name": "red"},
    {"colorCode": Colors.blue, "name": "blue"}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // children: myColor.map((e) {
      //   Color? codeColor = myColor[myColor.indexOf(e)]["colorCode"];
      //   String nameColor = myColor[myColor.indexOf(e)]["name"];
      //   return Expanded(
      //     flex: nameColor == 'pink' ? 2 : 1,
      //     child: Container(
      //       decoration: BoxDecoration(color: codeColor),
      //     ),
      //   );
      // }).toList(),
      children: [
        Row(
          children: const [
            ExpandedWidget(),
            FlexibleWidget(),
          ],
        ),
        Row(
          children: const [
            ExpandedWidget(),
            ExpandedWidget(),
          ],
        ),
        Row(
          children: const [
            FlexibleWidget(),
            FlexibleWidget(),
          ],
        ),
        Row(
          children: const [
            FlexibleWidget(),
            ExpandedWidget(),
          ],
        ),
      ],
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewHehe extends StatefulWidget {
  const ListViewHehe({Key? key}) : super(key: key);
  @override
  ListViewHeheState createState() => ListViewHeheState();
}

class GueList {
  String name;
  int id;
  int age;

  GueList(this.name, this.id, this.age);
}

class ListViewHeheState extends State<ListViewHehe> {
  final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List myList = [
    {
      "name": 'Teddi',
      "dataDiri": [
        {"umur": "22", "gender": "L"}
      ]
    },
    {
      "name": 'Rijlan',
      "dataDiri": [
        {"umur": "21", "gender": "L"}
      ]
    },
    {
      "name": 'Ihsan',
      "dataDiri": [
        {"umur": "22", "gender": "L"}
      ]
    },
    {
      "name": 'Faris',
      "dataDiri": [
        {"umur": "23", "gender": "L"}
      ]
    },
    {
      "name": 'Agustina',
      "dataDiri": [
        {"umur": "23", "gender": "P"}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     body: ListView(
      //         children: numberList.map((number) {
      //   return Container(
      //     height: 250,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       color: Colors.black,
      //       border: Border.all(color: Colors.white, width: 1),
      //     ),
      //     child: Text(
      //       "Hello Teddi".toUpperCase(),
      //       style: const TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontFamily: 'Mulish',
      //           fontSize: 24.0,
      //           color: Colors.white,
      //           letterSpacing: 10.0),
      //       textAlign: TextAlign.center,
      //     ),
      //   );
      // }).toList())
      // body: ListView.builder(
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       height: 250,
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: Colors.black,
      //         border: Border.all(color: Colors.white, width: 1),
      //       ),
      //       child: Text(
      //         "Hello Teddi".toUpperCase(),
      //         style: const TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontFamily: 'Mulish',
      //             fontSize: 24.0,
      //             color: Colors.white,
      //             letterSpacing: 10.0),
      //         textAlign: TextAlign.center,
      //       ),
      //     );
      //   },
      //   itemCount: numberList.length,
      // ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Text(
                "Hello ${myList[index]["name"]}".toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mulish',
                    fontSize: 24.0,
                    color: Colors.white,
                    letterSpacing: 10.0),
                textAlign: TextAlign.center,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: myList.length),
    );
  }
}

class PerbaikanTampilan extends StatefulWidget {
  @override
  PerbaikanTampilanState createState() => PerbaikanTampilanState();
}

class PerbaikanTampilanState extends State<PerbaikanTampilan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://images.unsplash.com/photo-1632010284700-1dd273139d73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              'Network Country'.toUpperCase(),
              style: const TextStyle(
                fontSize: 24.0,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20.0,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Open Office',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14.0),
                    )
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Icon(
                      Icons.timeline_outlined,
                      size: 20.0,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      '09:00 - 20:00',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14.0),
                    )
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Icon(
                      Icons.money_off_csred_outlined,
                      size: 20.0,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Open Office',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14.0),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'The easiest way to do it is to add the onChanged event of the TextField and convert to uppercase using the controller of the TextField just like the above: TextField ( controller: controllerReservation, onChanged',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Mulish'),
                )
              ],
            ),
          ),
          Container(
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1652394012521-9b613d1d873b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=875&q=80',
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1655216985244-3575ff74cb67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1654783859762-4231b96af3ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1655304672848-f4f12107882d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                        ),
                      ))
                ],
              )),
        ],
      ),
    ));
  }
}
