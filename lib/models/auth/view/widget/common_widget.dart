import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/widgets/cutom_component/custom_app_buttom.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';








AppBar appBar ({text,}){
  return AppBar(title:Text(text, style: AppStyle.title_text
      .copyWith(fontSize: Dimensions.fontSizeMid),
  ) ,centerTitle: true,);
}



Widget recoveryPassword() {
  return Container(
    margin: EdgeInsets.only(top: AppLayout.getHeight(12)),
    child: GestureDetector(
      onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
      child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "Forgot Password?",
            style: AppStyle.normal_text_grey
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
  return CustomAppButton(
      text: "",
      widget: Text(
        "Guest",
        style: AppStyle.mid_large_text.copyWith(color: AppColor.hintColor,fontSize:14),
      ),
      onPressed: () => Get.toNamed(Routes.MAIN),
      buttonRadius: Dimensions.radiusDefault,
      buttonColor:AppColor.hintColor.withOpacity(0.2)
  );
}


Widget signupBtnLayout() {
  return createUserAccount(
      context: Get.context,
      firstText: "New user? ",
      endText: AppString.text_sign_up,
      onAction: () => Get.toNamed(Routes.SIGN_UP));
}





titleTextLayout({context, titleText, subTitleText, subText}) {
  return Column(
    children: [
      Text(titleText,
          textAlign: TextAlign.center,
          style: AppStyle.title_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDoubleLarge)),
      customSpacerHeight(height: 6),
      _subTextLayout(context, subTitleText, subText)
    ],
  );
}

















_subTextLayout(context, text, subtext) {
  return Column(
    children: [
      Text(
        text,
        style: AppStyle.normal_text
            .copyWith(color: Theme.of(context).disabledColor.withOpacity(0.5)),
      ),
      Text(
        subtext,
        style: AppStyle.normal_text
            .copyWith(color: Theme.of(context).disabledColor.withOpacity(0.5)),
      ),
    ],
  );
}

createUserAccount({context, firstText, endText, onAction}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: firstText,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.radiusMid)),
          TextSpan(
            text: endText,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.radiusMid - 2,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onAction,
          ),
        ],
      ),
    ),
  );
}

clearAuthTextField(){
  passwordController.clear();
  phoneController.clear();
  confirmPassController.clear();
  userNameController.clear();
  emailController.clear();
}

