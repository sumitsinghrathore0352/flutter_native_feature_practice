import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:native_feature_practice/Screens/maps_screen.dart';
import 'package:native_feature_practice/helpers/location_helpers.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: locData.latitude, longitude: locData.longitude);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
    print(locData.latitude);
    print(locData.longitude);
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
              isSelecting: true,
            )));
    if (selectedLocation == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: _previewImageUrl == null
              ? const Text(
                  "No location is choosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                  onPressed: _getCurrentLocation,
                  icon: const Icon(Icons.location_on),
                  label: const Text("Current Location")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                  onPressed: _selectOnMap,
                  icon: const Icon(Icons.map),
                  label: const Text("Select on msp"))
            ],
          ),
        )
      ],
    );
  }
}
