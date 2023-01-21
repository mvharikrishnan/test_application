import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class getAddress {
  static Future<Placemark> fetchAddress() async {
    log("Address Fetching start");
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error("Location services are disabled.");
    }

    //check permission
    LocationPermission permission =await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    final geoLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = await placemarkFromCoordinates(
        geoLocation.latitude, geoLocation.longitude);

    var address = coordinates.first;

    log("${address.locality}");

    return address;
  }
}
