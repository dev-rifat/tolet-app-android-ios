import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_color.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import 'custom_spacer.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? weight;
  final Function? onAction;
  final IconData prefixIcon;
  final TextInputType? textInputType;
  final bool? isPasswordField;
  final bool? obsValue;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.weight,
    this.validator,
    this.isPasswordField = false,
    this.obsValue = false,
    required this.prefixIcon,
    this.textInputType,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final focusedCtx = FocusManager.instance.primaryFocus?.context;
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => Scrollable.ensureVisible(
              focusedCtx ?? context,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut,
            ));
    return isPasswordField == false
        ? _textFieldLayout(context)
        : _passwordFieldLayout(context, obsValue);
  }

  _textFieldLayout(context) {
    return TextFormField(
      controller: controller,
      style: subTextFieldTitleStyle,
      keyboardType: textInputType,
      cursorColor: AppColor.primaryColor,
      validator: validator,
      autofocus: false,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyle.mid_large_text.copyWith(
            color: AppColor.hintColor, fontSize: Dimensions.fontSizeDefault+1),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.hintColor.withOpacity(0.6),
        ),
        errorStyle: const TextStyle(
          color: Colors.red, // Set the color of the error text
          fontStyle: FontStyle.italic, // Set the style of the error text
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent), // Set border color for errors
        ),
        suffixIcon: weight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
        focusColor: AppColor.primaryColor,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.noColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.noColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      ),
    );
  }

  _passwordFieldLayout(context, obsValue) {
    return TextFormField(
      controller: controller,
      style: subTextFieldTitleStyle,
      autofocus: false,
      obscureText: obsValue,
      validator: validator,
      cursorColor: AppColor.primaryColor,

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyle.mid_large_text.copyWith(
            color: AppColor.hintColor, fontSize: Dimensions.fontSizeDefault+1),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.hintColor.withOpacity(0.6),
        ),
        errorStyle: const TextStyle(
          color: Colors.red, // Set the color of the error text
          fontStyle: FontStyle.italic, // Set the style of the error text
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent), // Set border color for errors
        ),
        suffixIcon: weight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
        focusColor: AppColor.primaryColor,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.noColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.noColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      ),
    );
  }
}

TextStyle get subTextFieldTitleStyle {
  return AppStyle.mid_large_text.copyWith(
      fontWeight: FontWeight.w400,
      color: AppColor.normalTextColor,
      fontSize: Dimensions.fontSizeDefault);
}
