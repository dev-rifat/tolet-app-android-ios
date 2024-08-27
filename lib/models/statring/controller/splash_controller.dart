import 'package:to_let_mobile_app/models/main/create_post/controller/multi_image_pic_controller.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common/controller/county_pickar_controller.dart';
import '../../../common/controller/date_time_controller.dart';
import '../../../common/controller/file_upload_controller.dart';
import '../../../common/controller/gender_controller.dart';
import '../../../common/controller/network_controller.dart';
import '../../../common/controller/pick_image_controller.dart';
import '../../auth/controller/auth_controller.dart';
import '../../main/home/controller/home_controller.dart';
import '../../main/profile/controller/profile_controller.dart';
import '../../main/properties/controller/properties_controller.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed( const Duration(seconds:3), () => chooseScreen());
    super.onReady();
  }

  Future chooseScreen() async {
    intController();
    if (GetStorage().read(AppString.ACCESS_TOKEN) != null) {
      Get.offNamed(Routes.MAIN);
    } else {
      await Get.offNamed(Routes.SIGN_IN);
    }
  }
}

void intController() {
  Get.put(ConnectivityController(), permanent: true);
  Get.put(CountryPickerController(), permanent: true);
  Get.put(PickImageController(), permanent: true);
  Get.put(GenderController(), permanent: true);
  Get.put(PikedProfileImgController(), permanent: true);
  Get.put(HomeController(), permanent: true);
  Get.put(ProfileController(), permanent: true);
  Get.put(DateTimeController(), permanent: true);
  Get.put(AuthController(), permanent: true);
  Get.put(PropertiesController(), permanent: true);
  Get.put(MultiImagePickerController(), permanent: true);
  Get.delete<SplashController>();
}
