import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: linearGradient,
          child: _logoLayout()),
    );
  }

  _logoLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 85,
            backgroundColor: AppColor.primaryColor.withOpacity(0.2),
            child: CircleAvatar(
                radius: 75,
                backgroundColor: AppColor.primaryColor.withOpacity(0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.home,
                      size: Dimensions.fontSizeExtraLarge + 10,
                      color: AppColor.cardColor,
                    ),
                    customSpacerHeight(height: 5),
                    const Text(
                      "ToLet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 10),
                    ),
                  ],
                ))),
      ],
    );
  }
}

BoxDecoration get linearGradient {
  return BoxDecoration(
    gradient: LinearGradient(colors: [
      AppColor.cardColor,
      AppColor.secondaryColor,
      AppColor.primaryColor,
    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
  );
}
