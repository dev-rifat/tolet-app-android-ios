import 'package:flutter/cupertino.dart';
import 'package:to_let_mobile_app/common/controller/input_controller.dart';
import '../../../../../common/widgets/cutom_component/cutom_input_field.dart';
import '../../../../../common/widgets/input_note.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';

Widget postTitleTextField() {
  return CustomInputField(
    hitText: "Title",
    controller: postTitleController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}

Widget bedRoomTextField() {
  return CustomInputField(
    hitText: "Bed room no.",
    controller: bedRoomController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}
Widget bathRoomTextField() {
  return CustomInputField(
    hitText: "Bath room no.",
    controller: bathRoomController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}Widget verandaTextField({controller}) {
  return CustomInputField(
    hitText: "Veranda no.",
    controller: verandaController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}Widget floorNoTextField({controller}) {
  return CustomInputField(
    hitText: "Floor no",
    controller: floorNoController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}Widget rentTextField({controller}) {
  return CustomInputField(
    hitText: "Rent.",
    controller: rentController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}
Widget additionalPhoneNumberTextField({controller}) {
  return CustomInputField(
    hitText: "Additional phone number",
    controller: additionalPhoneNumberController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}

Widget whatAppNumberTextField({controller}) {
  return CustomInputField(
    hitText: "WhatApp number",
    controller: whatAppNumberController,
    textInputType: TextInputType.number,
    hintStyle: AppStyle.normal_text_black.copyWith(
      color: AppColor.hintColor,
      fontSize: Dimensions.fontSizeDefault+1,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}



Widget descriptionTextField({controller}) {
  return InputNote(
    controller: descriptionController,
    hintText: "Description",
    validator: (value) {
      if (value!.isEmpty) {
        return AppString.text_field_is_requird;
      } else {
        return null;
      }
    },
  );
}



