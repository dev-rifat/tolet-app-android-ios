import 'package:to_let_mobile_app/common/controller/input_controller.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_layout.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import 'package:to_let_mobile_app/common/widgets/custom_app_button.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/cutom_component/custom_password_field.dart';
import '../../../../common/widgets/cutom_component/cutom_input_field.dart';

signInWithGoogle({context, onAction, text}) {
  return AppButton(
    buttonText: AppString.text_create_account.tr,
    textColor: Theme.of(context).colorScheme.onPrimary,
    onPressed: () => onAction(),
    buttonColor: Theme.of(context).hintColor.withOpacity(0.1),
    isButtonExpanded: false,
    // isTextButton: true,
  );
}

titleTextLayout({context, titleText, subTitleText, subText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(titleText,
          style: AppStyle.title_text.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Dimensions.fontSizeDoubleLarge)),
      customSpacerHeight(height: 6),
      _subTextLayout(context, subTitleText, subText)
    ],
  );
}

userEmailField(controller) {
  return CustomInputField(
    hitText: AppString.text_enter_email_address.tr,
    controller: controller,
    prefixIcon: Icon(
      Icons.email_outlined,
      color: AppColor.hintColor.withOpacity(0.6),
    ),
    borderColor: Colors.transparent,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.the_email_field_is_required;
      } else {
        return null;
      }
    },
  );
}

_subTextLayout(context, text, subtext) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
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
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Dimensions.radiusMid)),
          TextSpan(
            text: endText,
            style: AppStyle.mid_large_text.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Dimensions.radiusMid - 2,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onAction,
          ),
        ],
      ),
    ),
  );
}

userPasswordField({controller, context}) {
  return PasswordInputField(
    controller: passwordController,
    borderColor: Colors.transparent,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    hitText: "Enter password",
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.the_password_field_is_required;
      } else {
        return null;
      }
    },
    prefixIcon: Icon(
      Icons.lock_open_outlined,
      color: AppColor.hintColor.withOpacity(0.6),
    ),
  );
}

_backArrowButton(context) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(20)),
    child: GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: AppLayout.getHeight(40),
        width: AppLayout.getWidth(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),
        child: Center(
            child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onPrimary,
          size: Dimensions.fontSizeMid - 3,
        )),
      ),
    ),
  );
}

AppBar appBar(
    {context,
    text,
    bool argumentVal = false,
    Widget? widget,
    isNotificationHide = false,
    Widget? iconW,
    isLeadingHide = false,
    notAction}) {
  return argumentVal != true
      ? AppBar(
          leading: _backArrowButton(context),
          leadingWidth: 60,
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0)
      : AppBar(
          leading:
              isLeadingHide != true ? _backArrowButton(context) : Container(),
          leadingWidth: 60,
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          title: isNotificationHide == true
              ? Text(
                  text,
                  style: AppStyle.normal_text_black.copyWith(
                      fontSize: Dimensions.fontSizeMid - 2,
                      color: Theme.of(context).colorScheme.onPrimary),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: AppStyle.normal_text_black.copyWith(
                            fontSize: Dimensions.fontSizeMid - 2,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    const Spacer(),
                    isNotificationHide != true
                        ? widget ?? _actionIconButton(context, iconW, notAction)
                        : Container(),
                    customSpacerWidth(width: 20),
                  ],
                ),
          elevation: 0,
        );
}

_actionIconButton(context, iconW, onAction) {
  return iconW == null
      ? Stack(
          children: [
            CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                child: IconButton(
                    onPressed: onAction,
                    icon: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ))),
            const Positioned(
                right: 0,
                child: Icon(
                  Icons.circle,
                  color: AppColor.errorColor,
                  size: 11,
                ))
          ],
        )
      : CircleAvatar(
          backgroundColor: Theme.of(context).cardColor, child: iconW);
}

EdgeInsets get marginLayout {
  return EdgeInsets.only(
      left: AppLayout.getHeight(20), right: AppLayout.getWidth(20));
}
