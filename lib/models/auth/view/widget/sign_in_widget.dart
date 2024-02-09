import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import 'auth_view_widget.dart';

 Widget recoveryPassword() {
  return Container(
    margin: EdgeInsets.only(top: AppLayout.getHeight(12)),
    child: GestureDetector(
      onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
      child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "Forgot Password?",
            style: AppStyle.normal_text
                .copyWith(color: AppColor.hintColor.withOpacity(0.9)),
          )),
    ),
  );
}



Widget titleText() {
  return titleTextLayout(
      context: Get.context,
      titleText: "Sign in\nto your account",
      subTitleText: "Welcome Back You've Been Missed!",
      subText: "");
}

Widget guestButtonLayout() {
  return signInWithGoogle(
      context: Get.context,
      text: "Guest",
      onAction: () {
        Get.toNamed(Routes.MAIN);
      });
}

 Widget signupBtnLayout() {
  return createUserAccount(
      context: Get.context,
      firstText: "New user? ",
      endText: AppString.text_sign_up,
      onAction: () => Get.toNamed(Routes.SIGN_UP));
}