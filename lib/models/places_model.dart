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
    name: "Ras Elbar",
    latlng: const LatLng(31.507978410010615, 31.821824577938735),
  ),
  PlacesModel(
      id: "2",
      name: "Mansoura",
      latlng: const LatLng(31.03377238068991, 31.360398814781718)),
  PlacesModel(
      id: "3",
      name: "Domiatt",
      latlng: const LatLng(31.41821293734006, 31.812018125655563)),
  PlacesModel(
      id: "4",
      name: "Belqas",
      latlng: const LatLng(31.216006309265, 31.3613031634633))
];
