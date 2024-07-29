import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_layout.dart';
import '../../utils/dimensions.dart';



Future customButtonSheet({context,double? height=0.9, child,int duration=500, int reverseDuration=400}) {

  final AnimationController controller = AnimationController(
    duration:   Duration(milliseconds: duration),
    reverseDuration: Duration(milliseconds: reverseDuration),

    vsync: Navigator.of(context),
  );

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    transitionAnimationController: controller,
    backgroundColor: Theme.of(Get.context!).backgroundColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              Dimensions.radiusMid,
            ),
            topLeft: Radius.circular(Dimensions.fontSizeMid))),
    builder: (
      context,
    ) {
      return FractionallySizedBox(
        heightFactor: AppLayout.getHeight(height!),
        child: child,
      );
    },
  );
}
