
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_string.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import 'custom_spacer.dart';

class CustomDoubleAppButton extends StatelessWidget {
  final String buttonText;

  final Color btnColor;
 final Widget ?widget;
  final Function onAction;
  final Function  cancelAction;
  const CustomDoubleAppButton(
      {super.key, required this.buttonText,this.widget, required this.onAction,required this.cancelAction,this.btnColor=AppColor.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: ()=> cancelAction(),
            child: Container(
              height: AppLayout.getHeight(48),
              decoration: BoxDecoration(
                color: AppColor.cardColor,
                border: Border.all(
                    width: 1, color: btnColor.withOpacity(0.5)),
                borderRadius:
                    BorderRadius.circular(Dimensions.radiusExtraLarge),
              ),
              child: Center(
                  child: Text(AppString.text_close.tr,
                style: AppStyle.normal_text.copyWith(
                    color: btnColor.withOpacity(0.8),
                    fontSize: Dimensions.fontSizeMid - 3,
                    fontWeight: FontWeight.w700),
              )),
            ),
          ),
        ),
        customSpacerWidth(width: 20),
        Expanded(
          child: GestureDetector(
            onTap: ()=>onAction(),
            child: Container(
              height: AppLayout.getHeight(48),
              decoration: BoxDecoration(
                color: btnColor,
                borderRadius:
                    BorderRadius.circular(Dimensions.radiusExtraLarge),
              ),
              child: Center(
                  child: widget??Text(
                    buttonText,
                style: AppStyle.normal_text.copyWith(
                    color: AppColor.cardColor,
                    fontSize: Dimensions.fontSizeMid - 3,
                    fontWeight: FontWeight.w700),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
