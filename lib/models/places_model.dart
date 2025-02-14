import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesModel {
  final String id;
  final String name;
  final LatLng latlng;
  PlacesModel({required this.id, required this.name, required this.latlng});
}

List<PlacesModel> places = [
  PlacesModel(
    id: "1",
    name: "cairo",
    latlng: const LatLng(30.052925299427674, 31.309967210270326),
  ),
  PlacesModel(
      id: "2",
      name: "Alex",
      latlng: const LatLng(31.20217014771493, 29.9162285903348)),
  PlacesModel(
      id: "3",
      name: "Domiatt",
      latlng: const LatLng(31.43546357822963, 31.673213343895053))
];
