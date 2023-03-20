// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/run_updates.dart';



class RunScreen extends StatefulWidget {
  const RunScreen({Key? key}) : super(key: key);

  @override
  State<RunScreen> createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late Position currentPosition;
  bool hasCurrentLocation = false;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  // add Markers

  getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position){
      currentPosition = position;
      final Marker marker = Marker(
        markerId: MarkerId('Current Location'),
        position: LatLng(position.latitude, position.longitude),
      );
      setState(() {
        _markers.add(marker);
        hasCurrentLocation = true;
      });
    } );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Run'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        backgroundColor: Constants.scaffoldBackgroundColor,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: Expanded(
              child: hasCurrentLocation
                  ? GoogleMap(
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                mapType: MapType.terrain,
                compassEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(currentPosition.latitude,
                      currentPosition.longitude),
                  zoom: 18,
                ),
                markers: _markers,
              )
                  : Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RunUpdates(DateTime.now()),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constants.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'START',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


