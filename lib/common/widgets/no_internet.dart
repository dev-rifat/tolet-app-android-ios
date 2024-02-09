import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_color.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import 'custom_spacer.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _animationLayout(),
          _contentTextLayout(),
          customSpacerHeight(height: 40),
          _tryAgainBtn()
        ],
      ),
    );
  }

  _tryAgainBtn() {
    return Center(
      child: Container(
        height: AppLayout.getHeight(46),
        width: AppLayout.getHeight(200),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColor.primaryColor),
        child: Center(
            child: Text(
          "Try Again",
          style: AppStyle.mid_large_text
              .copyWith(fontSize: Dimensions.fontSizeMid),
        )),
      ),
    );
  }

  _contentTextLayout() {
    return Center(
      child: Column(
        children: [
          Text(
            "Ooops!",
            style: AppStyle.normal_text_grey.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeExtraLarge + 5),
          ),
          Text(
            "No internet connection found.",
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor.withOpacity(0.8),
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.fontSizeDefault + 1),
          ),
          Text(
            "Check your connection",
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor.withOpacity(0.8),
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.fontSizeDefault + 1),
          ),
        ],
      ),
    );
  }

  _animationLayout() {
    return SizedBox(
        height: AppLayout.getHeight(350),
        width: double.infinity,
        child: Lottie.asset(Images.no_internet));
  }
}
