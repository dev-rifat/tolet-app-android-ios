import 'package:to_let_mobile_app/common/widgets/custom_app_button.dart';
import 'package:to_let_mobile_app/common/widgets/custom_onloading.dart';
import 'package:to_let_mobile_app/common/widgets/custom_text_field.dart';
import 'package:to_let_mobile_app/models/auth/controller/auth_controller.dart';
import 'package:to_let_mobile_app/models/auth/view/widget/input_field_widget.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/widgets/custom_spacer.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../main/home/view/widget/card_style.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: appBar(context: context),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: marginLayout,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextLayout(
                    context: context,
                    titleText: "Create your account",
                    subTitleText: "Welcome back! Please enter your details",
                    subText: ""),
                customSpacerHeight(height: 28),
                _userNameField(),
                customSpacerHeight(height: 16),
                userEmailField(resEmailController),
                customSpacerHeight(height: 16),
                userContactField(),
                customSpacerHeight(height: 16),
                userAddressField(),
                customSpacerHeight(height: 16),
                userStateField(),
                customSpacerHeight(height: 16),
                userCityField(),
                customSpacerHeight(height: 16),
                userZipCodeField(),
                customSpacerHeight(height: 16),
                Obx(() => regUserPasswordField(
                      context: context,
                      controller: resPasswordController,
                    )),
                customSpacerHeight(height: 8),
                Card(
                  elevation: 0,
                  shape: roundedRectangleBorder,
                  color: AppColor.primaryOrange.withOpacity(0.08),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppString.text_password_alert_text,
                      style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                customSpacerHeight(height: 16),
                Obx(() => userConfirmPasswordField(
                    context: context, controller: confirmPassController)),
                customSpacerHeight(height: 30),
                Obx(
                  () => _signUpButtonLayout(context),
                ),
                customSpacerHeight(height: 20),
                signInWithGoogle(
                    context: context,
                    text: "Guest",
                    onAction: () {
                      Get.toNamed(Routes.MAIN);
                    }),
                customSpacerHeight(height: 12),
                createUserAccount(
                    context: context,
                    firstText: "Already Have Account? ",
                    endText: "log In",
                    onAction: () {
                      Get.toNamed(Routes.SIGN_IN);
                    }),
                customSpacerHeight(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signUpButtonLayout(context) {
    return AppButton(
      buttonText: "Sign Up",
      widget: Get.find<AuthController>().isSignUpLoading.value
          ? onLoading(color: AppColor.cardColor, isSize: .8)
          : Text(
              "Sign Up",
              style: AppStyle.mid_large_text,
            ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.find<AuthController>().signUp();
          GetStorage().write(AppString.USER_EMAIL, resEmailController.text);
          GetStorage().write(AppString.USER_PASSWORD, passwordController.text);
        }
      },
      isButtonExpanded: false,
      isUsedButton: true,
    );
  }
}

_userNameField() {
  return Row(
    children: [
      Expanded(
        child: AppInputField(
          title: "First Name *",
          hint: "Enter first name",
          controller: firstNameController,
          isFieldElevationHide: true,
          validator: (value) {
            if (value!.isEmpty) {
              return AppString.text_field_is_requird;
            } else {
              return null;
            }
          },
        ),
      ),
      customSpacerWidth(width: 12),
      Expanded(
        child: AppInputField(
          title: "Last Name *",
          hint: "Enter last name",
          controller: lastNameController,
          isFieldElevationHide: true,
          validator: (value) {
            if (value!.isEmpty) {
              return AppString.text_field_is_requird;
            } else {
              return null;
            }
          },
        ),
      ),
    ],
  );
}
