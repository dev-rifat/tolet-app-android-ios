import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import 'custom_spacer.dart';

AppBar customAppBar({String ?text,Widget? prefix}){
  return AppBar(
    backgroundColor: Colors.grey.shade100,
    leadingWidth: double.infinity,
    actions: [
      prefix??  GestureDetector(onTap: () {}, child: const Icon(CupertinoIcons.bell)),
      customSpacerWidth(width: 12),
    ],
    leading: Padding(
      padding: const EdgeInsets.only(left: 16.0,top: 14),
      child: Text(
        text??"",
        style: AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid),
      ),
    ),
  );
}