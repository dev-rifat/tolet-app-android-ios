import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget tileTextLayout({text, context, bool isHideText = false,onAction,addItemAction}) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyle.large_text.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Dimensions.fontSizeMid - 1),
          ),



          isHideText == false?

          Row(
            children: [
              addItemAction !=null?
              TextButton(
                  onPressed:addItemAction,
                  child: Text(
                    AppString.text_add.tr,
                    style:
                    AppStyle.normal_text.copyWith(color: AppColor.primaryColor),
                  )):Container(),
              TextButton(
                  onPressed:onAction,
                  child: Text(
                    AppString.text_view_all.tr,
                    style:
                        AppStyle.normal_text.copyWith(color: AppColor.primaryColor),
                  )),
            ],
          ):Container()
        ],
      ));
}
