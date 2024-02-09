import 'package:to_let_mobile_app/common/widgets/custom_app_button.dart';
import 'package:to_let_mobile_app/models/auth/view/widget/input_field_widget.dart';
import 'package:to_let_mobile_app/models/home/view/widget/home_view_widgets.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/controller/password_controller.dart';
import '../../../../common/widgets/custom_onloading.dart';
import '../../../../common/widgets/custom_spacer.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../controller/auth_controller.dart';
import '../widget/text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<PasswordController>()) {
      Get.delete<PasswordController>();
    }
    Get.put(PasswordController());
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: appBar(context: context),
        body: Padding(
          padding: marginLayout,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSpacerHeight(height: 56),
                _titleTextLayout(),
                  customSpacerHeight(height: 30),
                  const TextFieldLayout(),



                  _recoveryPassword(context: context),
                  customSpacerHeight(height: 30),
                  Obx(
                    () => _loginButtonLayout(context),
                  ),
                  customSpacerHeight(height: 24),
                  signInWithGoogle(
                      context: context,
                      text: "Guest",
                      onAction: () {
                        Get.toNamed(Routes.MAIN);
                      }),
                  const Spacer(),
                  createUserAccount(
                      context: context,
                      firstText: "New user? ",
                      endText: AppString.text_sign_up,
                      onAction: () => Get.toNamed(Routes.SIGN_UP)),
                  const Spacer(),
                  customSpacerHeight(height: 76),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _recoveryPassword({context}) {
    return Container(
      margin: EdgeInsets.only(top: AppLayout.getHeight(12)),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Recovery Password",
              style: AppStyle.normal_text
                  .copyWith(color: AppColor.hintColor.withOpacity(0.9)),
            )),
      ),
    );
  }

  _loginButtonLayout(context) {
    return AppButton(
      buttonText: "Login",
      widget: Get.find<AuthController>().isSignInLoading.value
          ? onLoading(color: AppColor.cardColor, isSize: .8)
          : Text(
              "Login",
              style: AppStyle.mid_large_text,
            ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.find<AuthController>()
              .logIn(emailController.text, passwordController.text);
          GetStorage().write(AppString.USER_EMAIL, emailController.text);
        }
      },
      isButtonExpanded: false,
      isUsedButton: true,
      buttonColor: AppColor.primaryColor,
    );
  }

  _titleTextLayout() {
    return   titleTextLayout(
        context: Get.context,
        titleText: "Sign in\nto your account",
        subTitleText: "Welcome Back You've Been Missed!",
        subText: "");
  }
}
