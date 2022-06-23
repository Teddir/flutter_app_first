import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screen/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Mulish');

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;
  DetailMobilePage({required this.place});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const FavoriteButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      place.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on_outlined),
                      SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  // Column(
                  //   children: <Widget>[
                  //     Icon(Icons.access_time),
                  //     SizedBox(height: 8.0),
                  //     Text(
                  //       place.openTime,
                  //       style: informationTextStyle,
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   children: <Widget>[
                  //     Icon(Icons.monetization_on),
                  //     SizedBox(height: 8.0),
                  //     Text(
                  //       place.ticketPrice,
                  //       style: informationTextStyle,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                place.description,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.9),
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(5),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final TourismPlace place;
  DetailWebPage({required this.place});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 64,
                ),
                child: Center(
                  child: Container(
                    width: 1200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wisata Bali',
                          style:
                              TextStyle(fontFamily: 'Mulish', fontSize: 32.0),
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    child: Image.network(place.imageAsset),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    height: 150,
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: place.imageUrls.map((url) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.network(url),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 32.0,
                            ),
                            Expanded(
                                child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        place.name,
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 30.0),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_today_outlined),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Text(
                                              place.openDays,
                                              textAlign: TextAlign.center,
                                              style: informationTextStyle,
                                            ),
                                          ],
                                        ),
                                        const FavoriteButton()
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.access_time_filled_outlined),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(place.openTime,
                                            textAlign: TextAlign.center,
                                            style: informationTextStyle),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.monetization_on_outlined),
                                        SizedBox(width: 8.0),
                                        Text(
                                          place.ticketPrice,
                                          style: informationTextStyle,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        place.description,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Mulish'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ))));
  }
}

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  DetailScreen({required this.place});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
      color: Colors.red,
    );
  }
}
