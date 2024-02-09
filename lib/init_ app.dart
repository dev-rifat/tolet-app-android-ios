import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'common/controller/date_time_controller.dart';
import 'common/controller/network_controller.dart';
import 'common/widgets/custom_single_date_pickar.dart';
import 'common/controller/county_pickar_controller.dart';
import 'common/controller/gender_controller.dart';
import 'common/controller/pick_image_controller.dart';
import 'models/auth/controller/auth_controller.dart';
import 'models/home/controller/home_controller.dart';
import 'common/controller/file_upload_controller.dart';
import 'models/statring/controller/splash_controller.dart';


Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  Get.put(SplashController(), permanent: true);
  Get.put(ConnectivityController(), permanent: true);
  Get.put(CountryPickerController(), permanent: true);
  Get.put(PickImageController(), permanent: true);
  Get.put(GenderController(), permanent: true);
  Get.put(PikedProfileImgController(), permanent: true);
  Get.put(HomeController(), permanent: true);
  Get.put(DateTimeController(), permanent: true);
  Get.put(DatePickerController(), permanent: true);
  Get.put(AuthController(), permanent: true);
}
