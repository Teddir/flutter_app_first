import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bali',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);
  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
    )));
  }
}
