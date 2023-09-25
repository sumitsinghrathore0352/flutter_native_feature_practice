import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:native_feature_practice/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 26.9829096,
      longitude: 75.7557908,
      address: "",
    ),
    this.isSelecting = false,
  });
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Location"), 
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
        target: LatLng(
            widget.initialLocation.latitude, widget.initialLocation.longitude),
        zoom: 16,
      )),
    );
  }
}
