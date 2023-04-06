// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address = '',
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  //final Uint8List image;
   final File image;
  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'location': location,
      'image': image,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'] as String,
      title: map['title'] as String,
      location: map['location'] as PlaceLocation,
      image: map['image'] as File,
       //image: File(map['image'] as String),
    );
  }

  @override
  String toString() {
    return 'Place(id: $id, title: $title, location: $location, image: $image)';
  }
}
