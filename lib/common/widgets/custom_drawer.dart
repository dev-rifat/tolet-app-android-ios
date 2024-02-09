import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import 'custom_spacer.dart';

void showCustomDrawer({required BuildContext context, required child}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Container(
        margin: const EdgeInsets.only(left: 100),
        child: Center(
          child: child,
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

void showCustomAtmBtnSheet(
    {required BuildContext context, required child, double height = 800}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height-height),
        child: Center(
          child: child,
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      }
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

Widget showCustomAtmBtnSheetAppBar({title}){
  return Padding(
    padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
    child: Column(
      children: [
        customSpacerHeight(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customSpacerWidth(width: 20),
            const Spacer(),

            Text(title,style: AppStyle.mid_large_text.copyWith(color: AppColor.normalTextColor),),
            const Spacer(),

            InkWell(
                onTap: ()=>Get.back(),
                child: const Icon(Icons.close))
          ],
        ),
        customSpacerHeight(height: 4),
        const Divider(),
      ],
    ),
  );
}