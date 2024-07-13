import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_color.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import 'custom_spacer.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? weight;
  final Function? onAction;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.hint,
    this.controller,
    this.weight,
    this.validator,
    this.prefixIcon,
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
    return prefixIcon != null
        ? _textFieldLayout(context)
        : _noPrefixIconField();
  }

  _textFieldLayout(context) {
    return TextFormField(
      controller: controller,
      style: subTextFieldTitleStyle,
      keyboardType: textInputType,
      validator: validator,
      autofocus: false,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: AppColor.hintColor,
            fontFamily: "Poppins",
            fontSize: Dimensions.fontSizeDefault + 1),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.hintColor,
        ),
        suffixIcon: weight,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
        focusColor: AppColor.primaryColor,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.disableColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.disableColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      ),
    );
  }

  _noPrefixIconField() {
    return TextFormField(
      controller: controller,
      style: subTextFieldTitleStyle,
      validator: validator,
      autofocus: false,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: AppColor.hintColor,
            fontFamily: "Poppins",
            fontSize: Dimensions.fontSizeDefault + 1),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
        focusColor: AppColor.primaryColor,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.normalTextColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.hintColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      ),
    );
  }
}

class CustomPassInputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? weight;
  final Function? onAction;
  final bool? obsValue;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  const CustomPassInputField({
    super.key,
    required this.hint,
    this.controller,
    this.obsValue,
    this.weight,
    this.validator,
    this.prefixIcon,
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
    return _passwordFieldLayout(context, obsValue);
  }

  _passwordFieldLayout(context, obsValue) {
    return TextFormField(
      controller: controller,
      style: _subTitleStyle1(context),
      autofocus: false,
      obscureText: obsValue,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: AppColor.hintColor,
            fontFamily: "Poppins",
            fontSize: Dimensions.fontSizeDefault + 1),
        suffixIcon: weight,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.hintColor,
        ),
        focusColor: AppColor.primaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.disableColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.disableColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      ),
    );
  }
}

_subTitleStyle1(BuildContext context) {
  return AppStyle.mid_large_text.copyWith(
      fontWeight: FontWeight.w400,
      color: context.isDarkMode ? AppColor.cardColor : AppColor.normalTextColor,
      fontSize: Dimensions.fontSizeDefault);
}

class AppInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? weight;
  final bool? isButtonExpanded;
  final bool? isFieldTitleHide;
  final bool? isFieldElevationHide;
  final bool? isInputTypeNumber;
  final bool? obsValue;
  final bool? isReadVal;
  final Function? onAction;
  final String? Function(String?)? validator;

  const AppInputField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.weight,
    this.validator,
    this.isButtonExpanded = false,
    this.isFieldElevationHide = false,
    this.isFieldTitleHide = false,
    this.isInputTypeNumber = false,
    this.obsValue = false,
    this.isReadVal = false,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isFieldTitleHide != true
            ? Text(title,
                style: _titleStyle(context.isDarkMode
                    ? AppColor.cardColor
                    : AppColor.normalTextColor))
            : Container(),
        isFieldTitleHide != true ? customSpacerHeight(height: 10) : Container(),
        isFieldElevationHide != true
            ? Card(
                elevation: 0,
                shape: _cardStyle,
                color: AppColor.hintColor.withOpacity(0.2),
                child: _textFieldLayout(context),
              )
            : _passwordFieldLayout(context, obsValue),
      ],
    );
  }

  _textFieldLayout(context) {
    return Row(
      children: [
        customSpacerWidth(width: 12),
        isFieldTitleHide != true
            ? Expanded(
                child: TextFormField(
                  controller: controller,
                  style: _subTitleStyle,
                  validator: validator,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: AppLayout.getWidth(16),
                        right: AppLayout.getWidth(20),
                        top: AppLayout.getHeight(16),
                        bottom: AppLayout.getHeight(16)),
                    hintText: hint,
                    focusColor: AppColor.primaryColor,
                    hintStyle: AppStyle.normal_text_black.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault + 1),
                    filled: false,
                    fillColor: AppColor.backgroundColor,
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault + 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, color: AppColor.primaryColor),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault + 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColor.hintColor),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault)),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, color: AppColor.primaryColor),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault + 2),
                    ),
                  ),
                  maxLines: isButtonExpanded == true ? 8 : 1,
                  minLines: isButtonExpanded == true ? 6 : 1,
                ),
              )
            : Expanded(
                child: TextFormField(
                  controller: controller,
                  style: _subTitleStyle,
                  validator: validator,
                  autofocus: false,
                  readOnly: isReadVal ?? false,
                  onTap: () => onAction!(),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: AppStyle.normal_text_black.copyWith(
                      color: AppColor.hintColor,
                    ),
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: AppColor.hintColor,
                    ),
                    focusColor: AppColor.primaryColor,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                            Dimensions.radiusDefault + 7)),
                  ),
                ),
              )
      ],
    );
  }

  _passwordFieldLayout(context, obsValue) {
    final focusedCtx = FocusManager.instance.primaryFocus!.context;
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => Scrollable.ensureVisible(
              focusedCtx!,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
            ));
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            style: _subTitleStyle1(context),
            autofocus: false,
            obscureText: obsValue,
            validator: validator,
            keyboardType: isInputTypeNumber != true
                ? TextInputType.emailAddress
                : TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: AppLayout.getWidth(16),
                  right: AppLayout.getWidth(20),
                  top: AppLayout.getHeight(16),
                  bottom: AppLayout.getHeight(16)),
              hintText: hint,
              suffixIcon: weight,
              focusColor: AppColor.primaryColor,
              hintStyle: AppStyle.normal_text_black.copyWith(
                  color: AppColor.hintColor,
                  fontSize: Dimensions.fontSizeDefault + 1),
              filled: false,
              fillColor: AppColor.backgroundColor,
              disabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(Dimensions.radiusDefault + 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 0.0, color: AppColor.primaryColor),
                borderRadius:
                    BorderRadius.circular(Dimensions.radiusDefault + 2),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.hintColor),
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 0.0, color: AppColor.primaryColor),
                borderRadius:
                    BorderRadius.circular(Dimensions.radiusDefault + 2),
              ),
            ),
            maxLines: isButtonExpanded == true ? 8 : 1,
            minLines: isButtonExpanded == true ? 6 : 1,
          ),
        ),
      ],
    );
  }

  _subTitleStyle1(BuildContext context) {
    return AppStyle.mid_large_text.copyWith(
        fontWeight: FontWeight.w400,
        color:
            context.isDarkMode ? AppColor.cardColor : AppColor.normalTextColor,
        fontSize: Dimensions.fontSizeDefault);
  }
}

RoundedRectangleBorder get _cardStyle {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Dimensions.radiusMid - 5),
  );
}

TextStyle _titleStyle(color) {
  return AppStyle.mid_large_text.copyWith(
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: Dimensions.fontSizeDefault + 2);
}

TextStyle get _subTitleStyle {
  return AppStyle.mid_large_text.copyWith(
      fontWeight: FontWeight.w400,
      color: AppColor.normalTextColor,
      fontSize: Dimensions.fontSizeDefault);
}

TextStyle get subTextFieldTitleStyle {
  return AppStyle.mid_large_text.copyWith(
      fontWeight: FontWeight.w400,
      color: AppColor.normalTextColor,
      fontSize: Dimensions.fontSizeDefault);
}
