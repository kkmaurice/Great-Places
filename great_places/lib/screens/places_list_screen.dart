import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routName);
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: FutureBuilder(
            future: context.read<GreatPlaces>().fetchAndSetPlaces(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: context.watch<GreatPlaces>().items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                        context.watch<GreatPlaces>().items[index].image),
                  ),
                  title: Text(
                    context.watch<GreatPlaces>().items[index].title,
                  ),
                  onTap: () {
                    // Go to detail page ...
                  },
                ),
              );
            }));
  }
}
