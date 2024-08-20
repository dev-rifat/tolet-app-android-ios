import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/common/widgets/cutom_component/custom_app_buttom.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';

class NoAuth extends StatelessWidget {
  const NoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Unauthenticated, please login',
            style: AppStyle.normal_text_grey,
            textAlign: TextAlign.center, // Center the text if desired
          ),
          customSpacerHeight(height: 15),
          Center(
            child: SizedBox(
              width: 170,
              height: 40,
              child: CustomAppButton(
                onPressed: () => Get.offNamed(Routes.SIGN_IN),
                text: "Login",
              ),
            ),
          )
        ],
      );

  }
}
