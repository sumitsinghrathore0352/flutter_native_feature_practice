import 'package:flutter/material.dart';
import 'package:native_feature_practice/Screens/add_place_screen.dart';
import 'package:native_feature_practice/provider/great_places.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ?
        const Center(child: CircularProgressIndicator(),) :Consumer<GreatPlaces>(
          child: const Text(
              "Got no places yet! Start adding some!"), // Removed Center widget
          builder: (ctx, greatPlaces, ch) {
            if (greatPlaces.items.isEmpty) {
              return const Text("Got no places yet! Start adding some!");
            } else {
              return ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (ctx, i) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(greatPlaces.items[i].image),
                        ),
                        title: Text(greatPlaces.items[i].title),
                        onTap: () {},
                      ));
            }
          },
        ),
      ),
    );
  }
}
