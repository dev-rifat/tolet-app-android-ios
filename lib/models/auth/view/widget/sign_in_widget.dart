import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/models/auth/view/widget/sign_up_text_field_widget.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../main/home/view/widget/card_style.dart';

class TextFieldLayout extends StatelessWidget {
  const TextFieldLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: roundedRectangleBorder.copyWith(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          side: const BorderSide(width: 1, color: AppColor.disableColor)),
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Column(
        children: [
          userPhoneNumberField(phoneController),
           divider(),
          userPasswordField(controller: passwordController),
        ],
      ),
    );
  }
}
