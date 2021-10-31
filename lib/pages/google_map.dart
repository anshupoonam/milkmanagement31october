import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:milkmanagement/utils/location_master.dart';

class GoogleMapData extends StatefulWidget {
  const GoogleMapData({Key? key}) : super(key: key);

  @override
  _GoogleMapDataState createState() => _GoogleMapDataState();
}

class _GoogleMapDataState extends State<GoogleMapData> {
  // ignore: non_constant_identifier_names
  String Address = '';
  // ignore: non_constant_identifier_names
  // Future<void> GetAddressFromLatLong() async {
  //   Position position = await LocationMaster.getLocation();
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark place = placemarks[0];
  //   Address =
  //       '${place.subAdministrativeArea}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  //   setState(() {});
  // }

  double _lat = 0.0;
  double _lng = 0.0;
  final Completer<GoogleMapController> _controller = Completer();

  var latLong = {};

  late Position position;

  @override
  initState() {
    super.initState();
    latLong = {};
    // GetAddressFromLatLong();
    getLatLonData();
    getAddress();
  }

  getLatLonData() async {
    position = await LocationMaster.getLocation();
    _lat = position.latitude;
    _lng = position.longitude;
    latLong = {"latitude": _lat, "longitude": _lng};
    setState(() {});
  }

  getAddress() async {
    Address = await LocationMaster.GetCurrentAddress();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //getLatLonData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Current Location"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 540,
            // width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(latLong['latitude'], latLong['longitude']),
                zoom: 12,
              ),
              myLocationEnabled: true,
              markers: {
                Marker(
                  markerId: const MarkerId('current'),
                  position: LatLng(latLong['latitude'], latLong['longitude']),
                )
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(Address),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Latitude: ${latLong['latitude']} '
                        ' Longitude: ${latLong['longitude']}'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
