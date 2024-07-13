import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed( const Duration(seconds:3), () => chooseScreen());
    super.onReady();
  }

  Future chooseScreen() async {
    if (GetStorage().read(AppString.ACCESS_TOKEN) != null) {
      Get.offNamed(Routes.MAIN);
    } else {
      await Get.offNamed(Routes.SIGN_IN);
    }
  }
}
