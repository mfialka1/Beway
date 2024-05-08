

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card Swiper
        Container(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                'https://via.placeholder.com/350x150',
                fit: BoxFit.fill,
              );
            },
            itemCount: 3,
            pagination: SwiperPagination(),
            control: SwiperControl(),
          ),
        ),
        // Google Maps
        Container(
          height: 200,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12,
            ),
            markers: {
              Marker(
                markerId: MarkerId('marker_1'),
                position: LatLng(37.7749, -122.4194),
                infoWindow: InfoWindow(
                  title: 'San Francisco',
                  snippet: 'Welcome to San Francisco!',
                ),
              ),
            },
          ),
        ),
        // SQLite
        ElevatedButton(
          onPressed: () async {
            var databasesPath = await getDatabasesPath();
            String path = databasesPath + 'demo.db';
            Database database = await openDatabase(path, version: 1,
                onCreate: (Database db, int version) async {
              // create table
              await db.execute(
                  'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT)');
            });
          },
          child: Text('Create SQLite Database'),
        ),
        // HTTP Request
        ElevatedButton(
          onPressed: () async {
            var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
          },
          child: Text('Make HTTP Request'),
        ),
        // Cached Network Image
        CachedNetworkImage(
          imageUrl: 'https://via.placeholder.com/150',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ],
    );
  }
}
