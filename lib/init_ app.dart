import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'common/controller/date_time_controller.dart';
import 'common/controller/network_controller.dart';
import 'common/controller/county_pickar_controller.dart';
import 'common/controller/gender_controller.dart';
import 'common/controller/pick_image_controller.dart';
import 'models/auth/controller/auth_controller.dart';
import 'common/controller/file_upload_controller.dart';
import 'models/main/favorite/hive/hive_object.dart';
import 'models/main/home/controller/home_controller.dart';
import 'models/statring/controller/splash_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';


String wishList="wishlist";

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open a box
  await Hive.initFlutter();

  // Register the adapter for your custom object
  Hive.registerAdapter(WishlistItemAdapter());

  // Open a box
  await Hive.openBox<WishlistItem>(wishList);


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
  Get.put(AuthController(), permanent: true);
}
