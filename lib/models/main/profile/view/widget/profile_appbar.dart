
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import '../../../../../utils/app_layout.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';


AppBar profileAppbar({onAction,context}){
  return AppBar(
    leadingWidth: AppLayout.getWidth(200),
    backgroundColor:Colors.grey.shade100,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 16.0,left: 18),
      child: Text(AppString.text_profile.tr,style: AppStyle.mid_large_text.copyWith(color: AppColor.normalTextColor,fontWeight: FontWeight.w600,fontSize: Dimensions.fontSizeMid+1),),
    ),
    actions: [
      IconButton(onPressed: onAction, icon: const Icon(Icons.menu))
    ],


  );
}