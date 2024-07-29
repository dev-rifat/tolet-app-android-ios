
import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';

class InputNote extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  const InputNote(
      {super.key,
      required this.controller,
      this.hintText = AppString.text_add_note_here,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final focusedCtx = FocusManager.instance.primaryFocus?.context;
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => Scrollable.ensureVisible(
              focusedCtx??context,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut,
            ));
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.multiline,
      controller: controller,
      validator: validator,
      cursorColor: AppColor.normalTextColor,

      decoration: InputDecoration(
          hintText: hintText,


          hintStyle: AppStyle.normal_text
              .copyWith(color: AppColor.hintColor, fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
              borderSide:  const BorderSide(color: AppColor.hintColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          enabledBorder: OutlineInputBorder(
              borderSide:  const BorderSide(color: AppColor.hintColor),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          border:  const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.hintColor))),
      maxLines: 4,
      maxLength: 150,
      minLines: 4,
    );
  }
}
