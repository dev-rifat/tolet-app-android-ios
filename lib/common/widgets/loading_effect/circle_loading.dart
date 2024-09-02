import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';

SizedBox loadingIndicator({Color? color,double? height,double ?width,double ?strokeWidth}) {
  return SizedBox(
      height: height??20,
      width:width?? 20,
      child: CircularProgressIndicator(
        color: color ?? AppColor.primaryColor,
        strokeWidth: strokeWidth??2,

      ));
}
