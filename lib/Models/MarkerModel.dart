import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerModel {
  final String name;
  final String url;
  final LatLng place;
  final String description;

  MarkerModel({this.name, this.url, this.place, this.description});
}

List<MarkerModel> markerList = [

];
