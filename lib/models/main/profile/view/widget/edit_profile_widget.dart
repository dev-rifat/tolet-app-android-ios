
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../common/controller/input_controller.dart';
import '../../../../../common/widgets/custom_double_app_button.dart';
import '../../../../../common/widgets/custom_spacer.dart';
import '../../../../../common/widgets/custom_text_field.dart';
import '../../../../../common/widgets/input_note.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_layout.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';


class TextFieldLayout extends StatelessWidget {
  TextFieldLayout({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userTextFieldLayout(
            hintText: AppString.text_first_name.tr,
            titleText: AppString.text_first_name.tr,
            controller: editFirstNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return AppString.fieldIsRequired;
              } else {
                return null;
              }
            },
          ),
          userTextFieldLayout(
            titleText: AppString.text_last_name.tr,
            controller: editLastNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return AppString.fieldIsRequired;
              } else {
                return null;
              }
            },
          ),
          userTextFieldLayout(
            titleText: AppString.text_phone.tr,
            controller: editPhoneController,
            textInputType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return AppString.fieldIsRequired;
              } else {
                return null;
              }
            },
          ),
          userTextFieldLayout(
            titleText: "Email",
            controller: emailController,
            readOnly: true,
            validator: (value) {
              if (value!.isEmpty) {
                return AppString.fieldIsRequired;
              } else {
                return null;
              }
            },
          ),
          customSpacerHeight(height: 20),
          Obx(() => _editBtnLayout()),
          customSpacerHeight(height: 80),
        ],
      ),
    );
  }

  _editBtnLayout() {
    return CustomDoubleAppButton(
            buttonText: AppString.text_save.tr,
            btnColor: AppColor.primaryColor,
            onAction: () {
              if (_formKey.currentState!.validate()) {

              }
            },
            cancelAction: () => Get.back());
  }
}

userTextFieldLayout(
    {required titleText,
      required TextEditingController controller,
      bool readOnly=false,
      hintText,
      maxLength,
      isNoteFieldVisible = false,
      validator,
      TextInputType? textInputType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$titleText",
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeDefault + 2),
      ),
      customSpacerHeight(height: 12),
      isNoteFieldVisible != false
          ? InputNote(
        controller: editBioController,
        hintText: AppString.text_bio.tr,
      )
          : CustomInputField(
        hint: hintText ?? titleText,
        controller: controller,
        validator: validator,
        textInputType: textInputType,
      ),
      customSpacerHeight(height: 12),
    ],
  );
}
userEditContactField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Phone",
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
          hintStyle: AppStyle.mid_large_text.copyWith(
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
          editPhoneController.text = phone.completeNumber;
        },
      ),
    ],
  );
}
