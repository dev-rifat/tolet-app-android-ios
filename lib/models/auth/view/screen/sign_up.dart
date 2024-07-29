import 'package:to_let_mobile_app/common/widgets/cutom_component/margin_layout.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/widgets/custom_onloading.dart';
import '../../../../common/widgets/custom_spacer.dart';
import '../../../../common/widgets/cutom_component/custom_app_buttom.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../main/home/view/widget/card_style.dart';
import '../../controller/auth_controller.dart';
import '../widget/common_widget.dart';
import '../widget/sign_up_text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: marginLayout,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customSpacerHeight(height: 30),
                  _titleText(context),
                  customSpacerHeight(height: 30),
                  Card(
                    elevation: 0,
                    shape: roundedRectangleBorder.copyWith(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault + 2),
                        side: const BorderSide(
                            width: 1, color: AppColor.disableColor)),
                    shadowColor: Colors.grey.withOpacity(0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        userNameField(userNameController),
                        divider(),
                        userPhoneNumberField(phoneController),
                        divider(),
                        userEmailField(emailController),
                        divider(),
                        userPasswordField(),
                        divider(),
                        userConfirmPasswordField(),
                      ],
                    ),
                  ),
                  customSpacerHeight(height: 30),
                  Obx(
                    () => _signUpButtonLayout(context),
                  ),
                  customSpacerHeight(height: 20),
                  guestButtonLayout(),
                  customSpacerHeight(height: 30),
                  _newUserCreate(context),
                  customSpacerHeight(height: 90),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _signUpButtonLayout(context) {
    return CustomAppButton(
      text: "Sign Up",
      widget: Get.find<AuthController>().isSignUpLoading.value
          ? onLoading(color: AppColor.cardColor, isSize: .8)
          : Text(
              "Sign Up",
              style: AppStyle.mid_large_text,
            ),
      buttonRadius: Dimensions.radiusDefault,
      buttonColor: AppColor.primaryColor,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.find<AuthController>().signUp();
        }
      },
    );
  }
}

_newUserCreate(context) {
  return createUserAccount(
      context: context,
      firstText: "Already have? ",
      endText: "Sign In",
      onAction: () {
        Get.toNamed(Routes.SIGN_IN);
        clearAuthTextField();
      });
}

_titleText(context) {
  return titleTextLayout(
      titleText: "Sign up\nto your account",
      subText: "",
      context: context,
      subTitleText: "Welcome Back You've Been Missed!");
}
