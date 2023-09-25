import 'package:flutter/material.dart';
import 'package:native_feature_practice/Screens/add_place_screen.dart';
import 'package:native_feature_practice/Screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import './provider/great_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PlacesListScreen(),
        routes: {AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen()},
      ),
    );
  }
}
