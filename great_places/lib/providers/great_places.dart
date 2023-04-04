import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        image: pickedImage,
        location: PlaceLocation(
          latitude: 37.422,
          longitude: -122.084,
          address: 'Googleplex, Mountain View, CA, USA',
        ));
    _items.add(newPlace);
    // print(newPlace);
    notifyListeners();
    DBHelper.insertData('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      //'location': json.encode(newPlace.location),
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: 37.422,
              longitude: -122.084,
              address: 'Googleplex, Mountain View, CA, USA',
            ),
          ),
        )
        .toList();
    print(_items);
    notifyListeners();
  }

  // Future<void> fetchAndSetPlaces() async {
  //   final dataList = await DBHelper.getData('user_places');
  //   if (dataList is List<Place>) {
  //     _items = dataList;
  //     print(_items);
  //     notifyListeners();
  //   }
  // }
}
