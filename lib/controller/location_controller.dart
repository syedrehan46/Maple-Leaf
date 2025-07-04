import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var address = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }
  Future<void> showLocationErrorDialog({
    required BuildContext context,
    required String message,
    required bool openAppSettings, // true = app settings, false = location settings
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Location Required"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              if (openAppSettings) {
                await Geolocator.openAppSettings(); // Open App settings
              } else {
                await Geolocator.openLocationSettings(); // Open GPS/location settings
              }
            },
            child: Text("Open Settings"),
          ),
        ],
      ),
    );
  }
  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      if (permission == LocationPermission.deniedForever) return;

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks.first;
      address.value =
      '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    } catch (e) {
      print("Location error: $e");
    }
  }
  Future<bool> checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Open app settings manually
      await Geolocator.openAppSettings();
      return false;
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }
  Future<bool> checkLocationReadyWithDialog(BuildContext context) async {
    // Step 1: Check if GPS is on
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await showLocationErrorDialog(
        context: context,
        message: "Please turn ON GPS/Location Service to continue.",
        openAppSettings: false,
      );
      return false;
    }

    // Step 2: Check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await showLocationErrorDialog(
          context: context,
          message: "Please allow location access for this app.",
          openAppSettings: false,
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await showLocationErrorDialog(
        context: context,
        message: "Permission is permanently denied. Open app settings.",
        openAppSettings: true,
      );
      return false;
    }

    return true;
  }

}
