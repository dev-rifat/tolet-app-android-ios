import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';

SizedBox loadingIndicator({Color? color}) {
  return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: color ?? AppColor.primaryColor,
        strokeWidth: 2,

      ));
}
