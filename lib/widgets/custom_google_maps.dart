import 'package:flutter/material.dart';
import 'package:google_maps/models/places_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        zoom: 10, target: LatLng(31.41821293734006, 31.812018125655563));
    initMarkers();
    initPolylines();
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
            polylines: polylines,
            zoomControlsEnabled: false,
            markers: markers,
            onMapCreated: (controller) {
              googleMapController = controller;
              initMapStyle();
            },
            // cameraTargetBounds: CameraTargetBounds(
            //   LatLngBounds(
            //     southwest: const LatLng(31.1, 31.5),
            //     northeast: const LatLng(31.6, 32.0),
            //   ),
            // ),
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

  void initMarkers() async {
    var markerimage = await BitmapDescriptor.asset(
        const ImageConfiguration(), 'assets/images/marker.png');
    var myPlaces = places
        .map((place) => Marker(
            icon: markerimage,
            markerId: MarkerId(place.id),
            position: place.latlng,
            infoWindow: InfoWindow(title: place.name)))
        .toSet();
    markers.addAll(myPlaces);
    setState(() {});
  }

  void initPolylines() {
    Polyline polyline1 = const Polyline(
        polylineId: PolylineId("1"),
        patterns: [PatternItem.dot],
        points: [
          LatLng(31.41821293734006, 31.812018125655563),
          LatLng(31.507978410010615, 31.821824577938735),
        ],
        color: Colors.red,
        startCap: Cap.roundCap,
        width: 3);
    Polyline polyline2 = const Polyline(
        polylineId: PolylineId("1"),
        points: [
          LatLng(31.507978410010615, 31.821824577938735),
          LatLng(31.216006309265, 31.3613031634633),
        ],
        color: Colors.blue,
        startCap: Cap.roundCap,
        width: 3);
    Polyline polyline3 = const Polyline(
        patterns: [PatternItem.dot],
        polylineId: PolylineId("1"),
        points: [
          LatLng(31.216006309265, 31.3613031634633),
          LatLng(31.03377238068991, 31.360398814781718),
        ],
        color: Colors.green,
        startCap: Cap.roundCap,
        width: 3);

    polylines.addAll({polyline1, polyline2, polyline3});
  }
}
