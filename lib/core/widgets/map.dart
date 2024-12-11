
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  @override
  void initState() {
    super.initState();
    

  }

  final LatLng _initialPosition = LatLng(37.7749, -122.4194); // San Francisco

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController c){

mapController=c;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 50,
        ),
      ),
    );
  }
}
