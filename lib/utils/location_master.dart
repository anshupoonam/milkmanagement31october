import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationMaster {
  static Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  static Future<String> GetCurrentAddress() async {
        Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    // ignore: non_constant_identifier_names
    String Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
        
    return Address;
   
  }

  static Future<bool> requestPermission(context) async {
    bool status = false;
    final Permission locationPermission = Permission.location;
    bool locationStatus = false;
    bool ispermanetelydenied = await locationPermission.isPermanentlyDenied;
    if (ispermanetelydenied) {
      print("denied");
      await openAppSettings();
    } else {
      status = true;
      var locationStatu = await locationPermission.request();
      locationStatus = locationStatu.isGranted;
      print(locationStatus);
    }
    return status;
  }
}
