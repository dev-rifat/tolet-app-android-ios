import 'dart:io';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:to_let_mobile_app/utils/app_layout.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../../../../common/widgets/custom_spacer.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final RxInt _currentIndex = 0.obs;
  final ExitAppController _controller = Get.put(ExitAppController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _controller.willPop(),
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Expanded(child: _onboardByImage(imageUrl: onboardImageIndex[_currentIndex.toInt()]),)),

                Obx(() => _onboardTitleText(text: '${onboardTitleIndex[_currentIndex.toInt()]}',color: Theme.of(context).colorScheme.onPrimary,)),

                customSpacerHeight(height: 20),
                Obx(() => _descriptionText(text: '${onboardDescriptionIndex[_currentIndex.toInt()]}',color: Theme.of(context).colorScheme.onPrimary,)),

                customSpacerHeight(height: 20),
                Obx(() => _dotsDecorator(onboardImg: onboardImageIndex.length, currentIndex: _currentIndex.toInt()),),

                customSpacerHeight(height: 30),
                _buttonLayout(
                    context: context,
                    titleText: onboardTitleIndex,
                    currentIndex: _currentIndex)
              ],
            ),
          )),
    );
  }
}

Widget _skipButton({context}) {
  return TextButton(
    onPressed: () => Get.offNamed(Routes.SIGN_IN),
    child: Text(
      AppString.text_skip.tr,
      style: GoogleFonts.poppins(
          fontSize: Dimensions.fontSizeMid,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w600),
    ),
  );
}

Widget _buttonLayout({context, currentIndex, titleText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _skipButton(context: context),
      const Spacer(),


     _nextBtn((){
       if (currentIndex == titleText.length - 1) {
         Get.offAndToNamed(Routes.SIGN_IN);
       } else {
         currentIndex + 1;
       }
     }),
    ],
  );
}

_nextBtn(onAction) {
  return      InkWell(
    onTap: onAction,
    child: Container(
      height: AppLayout.getHeight(50),
      width: AppLayout.getWidth(120),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppString.text_next.tr,style: AppStyle.normal_text_grey.copyWith(color: AppColor.cardColor,fontSize: Dimensions.fontSizeDefault+2),),
          customSpacerWidth(width: 4),
          const Icon(Icons.arrow_forward_ios_sharp,color: AppColor.cardColor,size: 18,),
        ],
      ),
    ),
  );
}
Widget _dotsDecorator({required onboardImg, required currentIndex}) {
  return Center(
    child: DotsIndicator(
      dotsCount: onboardImg,
      position: currentIndex,
      decorator:  DotsDecorator(
          color: AppColor.disableColor,
          activeColor: AppColor.primaryColor,
          size: const Size.square(8.0),
          activeSize: const Size(16.0, 7),
          activeShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(5.0), left: Radius.circular(5.0)))),
    ),
  );
}

Widget _onboardByImage({required imageUrl}) {
  return Center(
    child: Lottie.asset(
      imageUrl.toString(),
    ),
  );
}

Widget _descriptionText({required text,required color}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontSize: Dimensions.fontSizeMid, fontWeight: FontWeight.w300,color: color),
  );
}

Widget _onboardTitleText({text,color}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: Dimensions.fontSizeLarge + 7,
        color: color),
  );
}

class ExitAppController extends GetxController {
  Future<bool> willPop() async {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
    return false;
  }
}
