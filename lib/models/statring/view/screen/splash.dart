import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    backgroundColor: Colors.grey.shade100,
      backgroundColor: AppColor.primaryColor,
      body: _logoLayout(),
    );
  }

  _logoLayout() {
    return Center(
      child: Column(
        children: [
          customSpacerHeight(height: 100),
          Column(
            children: [
              Text(
                "Let's find\nthe best\nplease to\n     live",
                style: AppStyle.normal_text_grey.copyWith(
                    color: AppColor.cardColor,
                    fontSize: Dimensions.fontSizeExtraLarge + 16),
              ),
              customSpacerHeight(height: 20),
              Text(
                "Paradise to live",
                style: TextStyle(
                    color: AppColor.cardColor,
                    fontWeight: FontWeight.w200,
                    fontSize: Dimensions.fontSizeMid + 4,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const Spacer(),
           const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: AppColor.cardColor,
                strokeWidth: 2,
              )),
          customSpacerHeight(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Started",
                style: TextStyle(
                    color: AppColor.cardColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.fontSizeMid,
                    overflow: TextOverflow.ellipsis),
              ),
              customSpacerWidth(width: 8),
              const Icon(
                Icons.arrow_forward,
                color: AppColor.cardColor,
                size: 19,
              )
            ],
          ),
          customSpacerHeight(height: 30),
        ],
      ),
    );
  }
}
