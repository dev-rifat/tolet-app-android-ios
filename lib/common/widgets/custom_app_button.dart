import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_layout.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';



class AppButton extends StatelessWidget {
  final bool? hasOutline;
  final Color? borderColor;
  final String buttonText;
  final Function onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final Widget? widget;
  final bool? isButtonExpanded;
  final IconData? iconsData;
  final bool? isUsedButton;
  final bool? isSignInWithGoogle;

  const AppButton({super.key,
    this.hasOutline = false,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.textColor = Colors.white,
    this.borderColor = Colors.grey,
    this.isButtonExpanded = true,
    this.isUsedButton = false,
    this.isSignInWithGoogle = false,
    this.iconsData,
    this.widget,

  });

  @override
  Widget build(BuildContext context) {
    return isUsedButton !=true?
    isButtonExpanded == true
        ? Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton.icon(
          icon: iconsData == null ? Container() : Icon(iconsData,size: 20,color: textColor),
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
             ),
          onPressed: () async {
            onPressed();
          },
          label: Text(
            buttonText,overflow: TextOverflow.ellipsis,
            style: textColor != null
                ? AppStyle.normal_text.copyWith(
                color: textColor,
                fontWeight: hasOutline == false
                    ? FontWeight.w600
                    : FontWeight.w400)
                : AppStyle.normal_text.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    )
        : SizedBox(
      width: double.infinity,
      height: AppLayout.getHeight(50),
      child: TextButton.icon(
        icon: iconsData == null ? Container() : Icon(iconsData,color: textColor),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        ),
        onPressed: () async {
          onPressed();
        },
        label:  isSignInWithGoogle !=true?Text(
          buttonText,
          style: textColor != null
              ? AppStyle.normal_text.copyWith(
              color: textColor,
              fontWeight: hasOutline == false
                  ? FontWeight.w600
                  : FontWeight.w400)
              : AppStyle.normal_text.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image:AssetImage(Images.google)),
            customSpacerWidth(width: 10),
            Text(
              buttonText,
              style: textColor != null
                  ? AppStyle.normal_text.copyWith(
                  color: textColor,
                  fontWeight: hasOutline == false
                      ? FontWeight.w600
                      : FontWeight.w400)
                  : AppStyle.normal_text.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ):GestureDetector(
      onTap:()async{
        onPressed();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1,
        decoration: AppStyle.ContainerStyle.copyWith( color: AppColor.primaryColor,borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: double.infinity,
                width: 50,
                decoration: AppStyle.ContainerStyle.copyWith( color: AppColor.primaryColor,borderRadius: BorderRadius.circular(Dimensions.radiusLarge)),


              ),
            ),
            Expanded(child: Center(child: widget ??


                Text(buttonText,style: AppStyle.normal_text.copyWith(color: AppColor.cardColor),))),
            Container(
              height: double.infinity,
              width: AppLayout.getWidth(50),
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
