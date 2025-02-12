import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        target: LatLng(31.41821293734006, 31.812018125655563));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}
