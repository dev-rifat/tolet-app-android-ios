import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'init_ app.dart';

void main() async {
  await initApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale("en", "US"),
      initialRoute: AppPages.INITIAL,

      getPages: AppPages.routes,
    );
  }
}
