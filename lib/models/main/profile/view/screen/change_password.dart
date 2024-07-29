import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/controller/input_controller.dart';
import '../../../../../common/widgets/custom_double_app_button.dart';
import '../../../../../common/widgets/custom_spacer.dart';
import '../../../../../common/widgets/cutom_component/cutom_input_field.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../screen/edit_profile.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    currentPassword.clear();
    newPasswordController.clear();
    confirmPassController.clear();
    return Scaffold(
      appBar: customInsideAppbar(title: "Change password"),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: marginLayout.copyWith(left: 16, right: 16, bottom: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSpacerHeight(height: 14),
                _currentPassword(),
                customSpacerHeight(height: 14),
                _newPassword(),
                customSpacerHeight(height: 14),
                _confirmPassword(),
                customSpacerHeight(height: 20),
                _btnLayout()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _currentPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Current password",
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 2),
        ),
        customSpacerHeight(height: 12),
        CustomInputField(
          controller: currentPassword,
          hitText: "Current password",
          errorBorderColor: Colors.red,
          hintStyle: AppStyle.normal_text_black.copyWith(
            color: AppColor.hintColor,
            fontSize: Dimensions.fontSizeDefault+1,
          ),
          borderColor: AppColor.hintColor,
          validator: (value) {
            if (value!.isEmpty) {
              return "The password field is required!";
            } else if (value.length < 6) {
              return "Not valid password";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  _newPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New password",
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 2),
        ),
        customSpacerHeight(height: 12),
        CustomInputField(
          controller: newPasswordController,
          errorBorderColor: Colors.red,
          hintStyle: AppStyle.normal_text_black.copyWith(
            color: AppColor.hintColor,
            fontSize: Dimensions.fontSizeDefault+1,
          ),
          borderColor: AppColor.hintColor,
          hitText: "New password",
          validator: (value) {
            if (value!.isEmpty) {
              return "The password field is required!";
            } else if (value.length < 8) {
              return "The password field must be at least 8 characters.";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  _confirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm password",
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 2),
        ),
        customSpacerHeight(height: 12),
        CustomInputField(
          controller: confirmPassController,
          errorBorderColor: Colors.red,
          hintStyle: AppStyle.normal_text_black.copyWith(
            color: AppColor.hintColor,
            fontSize: Dimensions.fontSizeDefault+1,
          ),
          borderColor: AppColor.hintColor,
          hitText: "Confirm password",
          validator: (value) {
            if (value!.isEmpty) {
              return "The password field is required!";
            } else if (value.length < 8) {
              return "The password field must be at least 8 characters.";
            } else if (newPasswordController.text !=
                confirmPassController.text) {
              return "Password does not match. Please re-type again";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  _btnLayout() {
    return  CustomDoubleAppButton(
            buttonText: AppString.text_save.tr,
            btnColor: AppColor.primaryColor,
            onAction: () {
            },
            cancelAction: () => Get.back());
  }
}
