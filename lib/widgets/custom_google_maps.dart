import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 14, target: LatLng(31.41821293734006, 31.812018125655563));

    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            onMapCreated: (controller) {
              googleMapController = controller;
              initMapStyle();
            },
            cameraTargetBounds: CameraTargetBounds(
              LatLngBounds(
                southwest: const LatLng(31.1, 31.5),
                northeast: const LatLng(31.6, 32.0),
              ),
            ),
            initialCameraPosition: initialCameraPosition),
        Positioned(
          bottom: 10,
          right: 10,
          left: 10,
          child: ElevatedButton(
            onPressed: () {
              googleMapController.animateCamera(CameraUpdate.newLatLng(
                  const LatLng(31.216006309265, 31.3613031634633)));
            },
            child: const Text("Change Location"),
          ),
        ),
      ],
    );
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/map_night_style.json');
    googleMapController.setMapStyle(nightMapStyle);
  }
}
