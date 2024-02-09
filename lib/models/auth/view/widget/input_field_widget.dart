import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../common/controller/input_controller.dart';
import '../../../../common/controller/password_controller.dart';
import '../../../../common/widgets/custom_app_button.dart';
import '../../../../common/widgets/custom_spacer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/cutom_text_input_field.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

signInWithGoogle({context, onAction, text}) {
  return AppButton(
    buttonText: text,
    textColor: AppColor.normalTextColor,
    onPressed: () => onAction(),
    buttonColor: Theme.of(context).hintColor.withOpacity(0.1),
    isButtonExpanded: false,
  );
}

titleTextLayout({context, titleText, subTitleText, subText}) {
  return Column(
    children: [
      Center(
        child: Text(
          titleText,
          style: AppStyle.title_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDoubleLarge),
          textAlign: TextAlign.center,
        ),
      ),
      customSpacerHeight(height: 8),
      _subTextLayout(context, subTitleText, subText)
    ],
  );
}

userEmailField(TextEditingController? controller) {
  return CustomTextField(
    hint: "Email address",
    prefixIcon: Icons.email_outlined,
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.the_email_field_is_required;
      } else if (value.isEmpty || !RegExp(emailExp()).hasMatch(value)) {
        showErrorMessage(message: AppString.please_remove_space_address);
        return AppString.please_insert_a_valid_email_address;
      } else {
        return null;
      }
    },
  );
}

userContactField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Mobile number or,Land number *",
        style: AppStyle.mid_large_text.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeDefault + 2),
      ),
      customSpacerHeight(height: 12),
      IntlPhoneField(
        controller:
            TextEditingController(), // You can use your own controller here
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              left: AppLayout.getWidth(16),
              right: AppLayout.getWidth(20),
              top: AppLayout.getHeight(16),
              bottom: AppLayout.getHeight(16)),
          hintText: "Enter number",
          focusColor: AppColor.primaryColor,
          hintStyle: GoogleFonts.poppins(
              color: AppColor.hintColor,
              fontSize: Dimensions.fontSizeDefault + 1),
          filled: false,
          fillColor: AppColor.backgroundColor,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.hintColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          ),
        ),
        onChanged: (phone) {
          mobileNumController.text = phone.completeNumber;
        },
      ),
      AppInputField(
        title: "",
        hint: "Enter land number",
        controller: landNumController,
        isFieldElevationHide: true,
      ),
    ],
  );
}

userAddressField() {
  return AppInputField(
    title: "Address *",
    hint: "Enter address",
    controller: addressController,
    isFieldElevationHide: true,
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.fieldIsRequired;
      } else {
        return null;
      }
    },
  );
}

userStateField() {
  return AppInputField(
    title: "State *",
    hint: "Enter state",
    controller: stateController,
    isFieldElevationHide: true,
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.fieldIsRequired;
      } else {
        return null;
      }
    },
  );
}

userZipCodeField() {
  return AppInputField(
    title: "Zip code",
    hint: "Enter zip code",
    controller: zipController,
    isFieldElevationHide: true,
  );
}

userCityField() {
  return AppInputField(
    title: "City *",
    hint: "Enter city",
    controller: cityController,
    isFieldElevationHide: true,
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.fieldIsRequired;
      } else {
        return null;
      }
    },
  );
}

_subTextLayout(context, text, subtext) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        textAlign: TextAlign.center,
        style: AppStyle.normal_text
            .copyWith(color: Theme.of(context).disabledColor.withOpacity(0.5)),
      ),
      customSpacerHeight(height: 4),
      Text(
        subtext,
        textAlign: TextAlign.center,
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

userPasswordField({controller, context, hint}) {
  return CustomTextField(
    hint:  "Password",
    controller: controller,
    isPasswordField: true,
    obsValue:Get.find<PasswordController>().isValue.value ,
    prefixIcon: Icons.key,
    weight: IconButton(
      onPressed: () => Get.find<PasswordController>().changeVal(),
      icon: Get.find<PasswordController>().isValue.isTrue
          ? Icon(
              Icons.visibility_off_outlined,
              color: Theme.of(context).hintColor,
            )
          : Icon(
              Icons.remove_red_eye_outlined,
              color: Theme.of(context).hintColor,
            ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.the_password_field_is_required;
      } else if (value.length < 8) {
        return AppString.incorrect_user_or_password;
      } else {
        return null;
      }
    },
  );
}

regUserPasswordField({controller, context, hint}) {
  return AppInputField(
    title: "Password *",
    hint: hint ?? "Enter password",
    controller: controller,
    isFieldElevationHide: true,
    obsValue: Get.find<PasswordController>().isValue.value,
    weight: IconButton(
      onPressed: () => Get.find<PasswordController>().changeVal(),
      icon: Get.find<PasswordController>().isValue.isTrue
          ? Icon(
              Icons.visibility_off_outlined,
              color: Theme.of(context).hintColor,
            )
          : Icon(
              Icons.remove_red_eye_outlined,
              color: Theme.of(context).hintColor,
            ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.the_password_field_is_required;
      } else if (value.length < 8) {
        return AppString.the_password_must_be_at_least_8_character;
      } else if (value.isEmpty ||
          !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*\W)").hasMatch(value)) {
        return AppString.cant_not_be_correct_please_follow_this;
      } else {
        return null;
      }
    },
  );
}

userConfirmPasswordField({controller, context}) {
  return AppInputField(
    title: "Confirm Password *",
    hint: "Enter confirm password",
    controller: controller,
    isFieldElevationHide: true,
    obsValue: Get.find<PasswordController>().isConfirmValue.value,
    weight: IconButton(
      onPressed: () => Get.find<PasswordController>().confirmValue(),
      icon: Get.find<PasswordController>().isConfirmValue.isTrue
          ? Icon(
              Icons.visibility_off_outlined,
              color: Theme.of(context).hintColor,
            )
          : Icon(
              Icons.remove_red_eye_outlined,
              color: Theme.of(context).hintColor,
            ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.the_confirm_password_field_is_required;
      } else if (value != resPasswordController.text) {
        print("value =$value");
        print("pass controller ==> ${resPasswordController.text}");
        return AppString.the_password_confirmation_does_not_match;
      } else {
        return null;
      }
    },
  );
}

_backArrowButton(context) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(20)),
    child: GestureDetector(
      onTap: () => Get.back(),
      child: Center(
          child: Icon(
        Icons.arrow_back_ios,
        color: AppColor.secondaryColor,
        size: Dimensions.fontSizeMid + 4,
      )),
    ),
  );
}

AppBar appBar({
  context,
  text,
  bool argumentVal = false,
  Widget? widget,
  Widget? iconW,
}) {
  return AppBar(
      leading: _backArrowButton(context),
      leadingWidth: 60,
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0);
}

_actionIconButton(context) {
  return Stack(
    children: [
      CircleAvatar(
          backgroundColor: Theme.of(context).cardColor,
          child: IconButton(
              onPressed: () {},
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
  );
}

EdgeInsets get marginLayout {
  return EdgeInsets.only(
      left: AppLayout.getHeight(16), right: AppLayout.getWidth(16));
}

emailExp() {
  const pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  return pattern;
}
