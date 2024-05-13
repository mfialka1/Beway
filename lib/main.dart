

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:http/http.dart' as http;
//import 'package:cached_network_image/cached_network_image.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Card Swiper Example'),
        ),
        body: Center(
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
            itemCount: 10, // Number of cards in swiper
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ),
      ),
    );
  }
}
