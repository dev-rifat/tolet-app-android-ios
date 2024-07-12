import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_style.dart';
import '../../../utils/dimensions.dart';

 Widget buildCustomTitleText({String? text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text ?? "",
        style: AppStyle.normal_text_grey.copyWith(
            color: AppColor.normalTextColor, fontSize: Dimensions.fontSizeMid),
      ),
      Text(
        "See more",
        style: AppStyle.normal_text_black
            .copyWith(
            color: AppColor.primaryColor,
            overflow: TextOverflow.ellipsis),
      ),
    ],
  );
}
