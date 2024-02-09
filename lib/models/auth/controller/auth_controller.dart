import 'dart:developer';
import 'package:to_let_mobile_app/common/widgets/error_message.dart';
import 'package:to_let_mobile_app/common/widgets/success_message.dart';
import 'package:to_let_mobile_app/models/auth/model/error_model.dart';
import 'package:to_let_mobile_app/models/auth/model/signin_model.dart';
import 'package:to_let_mobile_app/models/auth/model/signup_model.dart';
import 'package:to_let_mobile_app/network/network_client.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/controller/input_controller.dart';

class AuthController extends GetxController with StateMixin {
  final isSignInLoading = false.obs;
  final isSignUpLoading = false.obs;

  Future<void> logIn(email, password) async {
    isSignInLoading(true);
    try {
      Response response = await NetworkClient().postRequest(Api.LOG_IN, {
        "email": email,
        "password": password,
      });
      if (response.hasError) {
        logErrorMessage(logName: "login", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "login", response: response);
        GetStorage().write(
            AppString.ACCESS_TOKEN,
            SignInResponse.fromJson(response.body).data?.accessToken ??
                "${response.body["token"]}");
        log("token==> ${GetStorage().read(AppString.ACCESS_TOKEN)}");
        _routes();
      }
    } catch (e) {
      log(e.toString());
    }
    isSignInLoading(false);
  }

  Future<void> signUp() async {
    isSignUpLoading(true);
    try {
      Response response = await NetworkClient().postRequest(Api.RESISTER, {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "email": resEmailController.text,
        "mobile_number": mobileNumController.text,
        "land_number": landNumController.text,
        "address": addressController.text,
        "state": stateController.text,
        "city": cityController.text,
        "zip": zipController.text,
        "password": resPasswordController.text,
        "confirm_password": confirmPassController.text,
      });

      if (response.hasError) {
        logErrorMessage(logName: "signup", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ??
                "The email has already been taken");
      } else {
        logSuccessMessage(logName: "signup", response: response);
        GetStorage().write(
            AppString.ACCESS_TOKEN,
            SignInResponse.fromJson(response.body).data?.accessToken ??
                "${response.body["token"]}");
        log("token==> ${GetStorage().read(AppString.ACCESS_TOKEN)}");
        _routes();
      }
    } catch (e) {
      log(e.toString());
    }
    isSignUpLoading(false);
  }

  Future<void> forgot() async {
    isSignUpLoading(true);
    try {
      Response response = await NetworkClient().postRequest(Api.FORGOT, {
        "email": restPasswordController.text,
      });
      if (response.hasError) {
        logErrorMessage(logName: "forgot", response: response);
        showErrorMessage(
            message:
                ErrorModel.fromJson(response.body).error ?? "Email not found");
      } else {
        logSuccessMessage(logName: "forgot", response: response);

        showSuccessMessage(message: "Reset link sent to your email");

        log("forgot==> ${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
    isSignUpLoading(false);
  }

  void _routes() {
    if (GetStorage().read(AppString.ACCESS_TOKEN) != null) {
      Get.toNamed(Routes.MAIN);
    }
  }
}
