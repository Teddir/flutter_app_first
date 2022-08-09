import 'package:flutter/material.dart';
import 'package:flutter_app/screen/detail_place.dart';
import 'package:flutter_app/screen/tourism_place.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bali',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: MainScreens(),
    );
  }
}

// project wisata 2
class TourismPlaceWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Image.network(place.imageAsset),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Mulish'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                place.ticketPrice,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(place.openTime),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}

class TourismPlaceWebGrid extends StatelessWidget {
  final int gridCount;
  TourismPlaceWebGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: tourismPlaceList.map((place) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(place: place);
                  },
                ));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Image.network(
                      place.imageAsset,
                      fit: BoxFit.cover,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 6.0),
                      child: Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mulish',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 6.0),
                      child: Text(place.location,
                          style: const TextStyle(
                            fontSize: 14.0,
                          )),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// project wisata 1
class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Bali')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return TourismPlaceWeb();
          } else if (constraints.maxWidth <= 1200) {
            return TourismPlaceWebGrid(gridCount: 4);
          } else {
            return TourismPlaceWebGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

// MediaQuery & LayoutBuilder

//-------------> start example
class BoxResponsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return ListView(
            children: _generateContainers(),
          );
        } else if (constraints.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 2,
            children: _generateContainers(),
          );
        } else {
          return GridView.count(
            crossAxisCount: 6,
            children: _generateContainers(),
          );
        }
      }),
    );
  }

  List<Widget> _generateContainers() {
    return List<Widget>.generate(24, (index) {
      return Container(
        margin: const EdgeInsets.all(8),
        color: Colors.black12,
        height: 200,
      );
    });
  }
}

//-------------> end example

class MediaQue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Query'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Screen Width : ${screenSize.width.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'Mulish'),
              textAlign: TextAlign.center,
            ),
            Text(
              'Orientation : $orientation',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'Mulish'),
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}

class LayoutBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Row(children: [
        Expanded(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'LayoutBuilder: ${constraints.maxWidth}',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        )),
        Expanded(
            flex: 3,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'MediaQuery: ${screenSize.width.toStringAsFixed(2)}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'LayoutBuilder: ${constraints.maxWidth}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            )),
      ]),
    );
  }
}

// navigation
class FirstScreen extends StatelessWidget {
  final String message = 'Hello Bro aku props dari screnn pertama ygy';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstScreen"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScondScreen(message)));
              },
              child: const Text('GoTo ScondScreen')),
        ),
      ),
    );
  }
}

class ScondScreen extends StatelessWidget {
  final String message;
  const ScondScreen(this.message, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScondScreen'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(
              height: 5.0,
              width: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back ygy')),
          ],
        )),
      ),
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
  const PerbaikanTampilan({Key? key}) : super(key: key);
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
