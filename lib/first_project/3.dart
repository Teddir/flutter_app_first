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
  String? bahasa;
  String _name = '';
  bool lightOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Taman Ujung Bali',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mulish'),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: const [
                    Icon(Icons.calendar_today_outlined),
                    SizedBox(height: 8.0),
                    Text('Open Everydy'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.access_time_outlined),
                    SizedBox(height: 8.0),
                    Text('09:00 - 20:00'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.monetization_on_outlined),
                    SizedBox(height: 8.0),
                    Text('25.000'),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 16.0),
            child: Column(
              children: const <Widget>[
                Text(
                  'alankan aplikasi Anda. Saat ini device atau emulator Anda memang masih belum menampilkan apa pun. Namun, kita akan memanfaatkan fitur hot reload untuk melihat perubahan-perubahan yang akan kita lakukan ke depan.',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  color: Colors.blue,
                ),
                TextButton(onPressed: () {}, child: const Text('Click Me')),
                OutlinedButton(onPressed: () {}, child: const Text('Click Me')),
                ElevatedButton(onPressed: () {}, child: const Text('Click Me')),
                DropdownButton(
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                          value: 'Dart',
                          child: Text(
                            'Dart',
                            style: TextStyle(fontFamily: 'Mulish'),
                          )),
                      DropdownMenuItem<String>(
                          value: 'Kotlin', child: Text('Kotlin')),
                      DropdownMenuItem<String>(
                          value: 'Swift', child: Text('Swift')),
                    ],
                    value: bahasa,
                    onChanged: (String? value) {
                      setState(() {
                        bahasa = value;
                      });
                    })
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Write you name ygy', labelText: 'Your Name'),
                  onChanged: (String value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                    onPressed: (() {
                      _name == ''
                          ? ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                              content: Text('Input your name'),
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.orange,
                            ))
                          : showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('Hello $_name'),
                                );
                              });
                    }),
                    child: const Text('Simpan'))
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Switch(
                      value: lightOn,
                      onChanged: (bool value) {
                        setState(() {
                          lightOn = !lightOn;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(lightOn ? 'Light On' : 'Light Off'),
                          duration: const Duration(seconds: 1),
                        ));
                      })
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Radio<String>(
                    value: 'Dart',
                    groupValue: bahasa,
                    onChanged: (value) {
                      setState(() {
                        bahasa = value;
                        showSnackbar();
                      });
                    },
                  ),
                  title: const Text(
                    "Dart",
                    style: TextStyle(fontFamily: 'Mulish'),
                  ),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Kotlin',
                    groupValue: bahasa,
                    onChanged: (value) {
                      setState(() {
                        bahasa = value;
                        showSnackbar();
                      });
                    },
                  ),
                  title: const Text("Kotlin"),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Swift',
                    groupValue: bahasa,
                    onChanged: (value) {
                      setState(() {
                        bahasa = value;
                        showSnackbar();
                      });
                    },
                  ),
                  title: const Text("Swift"),
                ),
                ListTile(
                  leading: Checkbox(
                    value: lightOn,
                    onChanged: (value) {
                      setState(() {
                        lightOn = !lightOn;
                      });
                    },
                  ),
                  title: const Text("Agree / Disagree"),
                )
              ],
            ),
          ),
          Container(
              child: Center(
            child: Row(
              children: <Widget>[
                Container(
                    child: Image.asset(
                  'src/images/image1.jpg',
                  width: 50.0,
                  height: 50.0,
                )),
                Container(
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/70432343?s=400&u=28cb38e69ccc24851c36e55f7f4a388a73d69d3d&v=4',
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
                Container(
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/70432343?s=400&u=28cb38e69ccc24851c36e55f7f4a388a73d69d3d&v=4',
                    ),
                    radius: 50,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    )));
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$bahasa selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
