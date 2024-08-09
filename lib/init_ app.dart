import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'models/main/favorite/hive/hive_object.dart';
import 'models/statring/controller/splash_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

String wishListTableKey = "wishlist";

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
///For using int. Hive Local storage
  _initHive();

  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  Get.put(SplashController());
}

 _initHive() async {
  // Initialize Hive and open a box
  await Hive.initFlutter();

  // Register the adapter for your custom object
  Hive.registerAdapter(WishlistItemAdapter());

  // Open a box
  await Hive.openBox<WishlistItem>(wishListTableKey);
}
