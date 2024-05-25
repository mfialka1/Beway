//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
 // GoogleMapController mapController;

  // Replace with your actual latitude and longitude (consider user location)
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(48.148594, 17.107447), // Example coordinates (Bratislava, Slovakia)
    zoom: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            //mapController = controller;
          });
        },
      ),
    );
  }
}