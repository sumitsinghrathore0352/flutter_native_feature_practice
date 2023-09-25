import 'package:flutter/foundation.dart';
import 'package:native_feature_practice/helpers/db_helpers.dart';
import '../models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }
  void addPlace (String pickedtitle, File pickedImage) {
      final newPlace = Place(
          id: DateTime.now().toString(),
          title: pickedtitle,
          location: PlaceLocation(
              // You should provide the appropriate values here for latitude and longitude.
              latitude: 0.0, // Replace with the actual latitude.
              longitude: 0.0, // Replace with the actual longitude.
              address: " "), 
          image: pickedImage);
      _items.add(newPlace);
      notifyListeners();
      DBHelper.insert("user_places", {
        "id": newPlace.id,
        "id": newPlace.id,
        "title": newPlace.title,
        "image": newPlace.image.path,
      });
    }
    Future<void> fetchAndSetPlaces() async{
      final dataList= await DBHelper.getData('user_places');
      _items = dataList.map((item) => Place(id: item["id"], title: item["title"], location: PlaceLocation(
        // You should provide the appropriate values here for latitude and longitude.
          latitude: 0.0, // Replace with the actual latitude.
          longitude: 0.0, // Replace with the actual longitude.
          address: " "),
          image:File(item["image"]))).toList();
      notifyListeners();
    }
}
