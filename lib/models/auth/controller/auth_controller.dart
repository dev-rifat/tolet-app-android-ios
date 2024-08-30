import 'dart:developer';
import 'package:to_let_mobile_app/common/widgets/error_message.dart';
import 'package:to_let_mobile_app/models/auth/model/error_model.dart';
import 'package:to_let_mobile_app/models/auth/model/signin_model.dart';
import 'package:to_let_mobile_app/models/main/create_post/controller/create_post_controller.dart';
import 'package:to_let_mobile_app/models/main/profile/controller/profile_controller.dart';
import 'package:to_let_mobile_app/network/network_client.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common/controller/input_controller.dart';
import '../../main/home/controller/home_controller.dart';

class AuthController extends GetxController with StateMixin {
  final isSignInLoading = false.obs;
  final isSignUpLoading = false.obs;

  Future<void> logIn() async {
    isSignInLoading(true);
    Map<String, dynamic> signInMapData = {
      "phone_number": phoneController.text,
      "password": passwordController.text
    };
    try {
      Response response =
          await NetworkClient().postRequest(Api.logIn, signInMapData);
      if (response.hasError) {
        _error(response, "logIn");
      } else {
        logSuccessMessage(logName: "login", response: response);
        _routes(response);
      }
    } catch (e) {
      log(e.toString());
    }
    isSignInLoading(false);
  }

  Future<void> signUp() async {
    isSignUpLoading(true);

    Map<dynamic, dynamic> signUpMapData = {
      "name": userNameController.text,
      "email": emailController.text,
      "phone_number": phoneController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPassController.text
    };
    try {
      Response response =
          await NetworkClient().postRequest(Api.signUp, signUpMapData);
      if (response.hasError) {
        _error(response, "signup");
      } else {
        logSuccessMessage(logName: "signup", response: response);
        _routes(response);
      }
    } catch (e) {
      log(e.toString());
    }
    isSignUpLoading(false);
  }

  void _routes(Response response) {
    _storeData();
    GetStorage()
      ..write(
          AppString.ID_STORE, SignInResponse.fromJson(response.body).user?.id)
      ..write(AppString.ACCESS_TOKEN,
              SignInResponse.fromJson(response.body).token)
          .then((value) {
            Get.find<ProfileController>()..getProfile()..getMyPost();
            // Get.find<HomeController>()
            Get.find<CreatePostController>().getDistrictList();

        Get.toNamed(Routes.MAIN);
      });
  }

  void _storeData() {
    GetStorage().write(
      AppString.USER_EMAIL,
      emailController.text,
    );
    GetStorage().write(
      AppString.USER_PASSWORD,
      passwordController.text,
    );
  }

  void _error(Response response, String methodName) {
    print("$methodName ::: $response");
    logErrorMessage(logName: methodName, response: response);
    if (methodName == "logIn") {
      showErrorMessage(
          message: ErrorModel.fromJson(response.body).message ?? "");
    } else {
      showErrorMessage(
          message: ErrorModel.fromJson(response.body).errorMessage ?? "");
    }
  }
}
