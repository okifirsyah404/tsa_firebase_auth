import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeoLocationController extends GetxController {
  TextEditingController locationInputController = TextEditingController();

  RxString locationMessage = "Belum mendapat Lat dan Long".obs;
  RxString addressMessage = "Mencari Lokasi".obs;

  Position _myPosition = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0.0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  Future<void> determinePosition() async {
    LocationPermission locationPermission;

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error("Location services belum aktif");

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location Permission Ditolak");
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error(
          "Location Permission Ditolak, Gagal Request Permissons");
    }

    _myPosition = await Geolocator.getCurrentPosition();
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location service belum aktif");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied)
        return Future.error("Location Permission ditolak");
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permission ditolak, gagal request permissions");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    addressMessage.value =
        "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country} ";
  }

  void changeLocationMessage(Position position) {
    locationMessage.value = "Lat : ${position.latitude}, Long : ${position.longitude}";
  }

  void intentGoogleMaps() {
    final intent = AndroidIntent(
      action: "action_view",
      data: Uri.encodeFull("google.navigation:q=${locationInputController.text}&avoid=tf"),
      package: "com.google.android.apps.maps"
    );

    intent.launch();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

}
