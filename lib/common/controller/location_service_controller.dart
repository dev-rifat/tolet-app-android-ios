import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../utils/app_string.dart';

class LocationServiceController extends GetxController {
  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  String getLatitude = "${GetStorage().read(AppString.LATITUDE)??"23.8198728"}";
  String getLongitude = "${GetStorage().read(AppString.LONGTITUDE)??"90.3671919"}";


  getLocation() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      log("Location permission denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      getLatitude = currentPosition.latitude.toString();
      getLongitude = currentPosition.longitude.toString();
      log("Latitude ::: ${currentPosition.latitude}");
      log("longitude ::: ${currentPosition.longitude}");

      GetStorage().write(AppString.LATITUDE, currentPosition.latitude.toString());
      GetStorage().write(AppString.LONGTITUDE, currentPosition.longitude.toString());
    }
  }
}
