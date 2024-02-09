import 'package:to_let_mobile_app/models/auth/controller/auth_controller.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/widgets/custom_app_button.dart';
import '../../../../common/widgets/custom_onloading.dart';
import '../../../../common/widgets/custom_spacer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../widget/input_field_widget.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar(context: context),
        body: Container(
          padding: marginLayout,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSpacerHeight(height: 50),
              _titleText(context),
              customSpacerHeight(height: 40),
              _resentEmailField(),
              customSpacerHeight(height: 40),
            Obx(() => _resetButtonLayout(context),),
            ],
          ),
        ),
      ),
    );
  }

  _resetButtonLayout(context) {
    return
      AppButton(
        buttonText: "Reset Password",
        widget:Get.find<AuthController>().isSignUpLoading.value?onLoading(color: AppColor.cardColor,isSize: .6):
        Text("Reset Password",style: AppStyle.mid_large_text,),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
              Get.find<AuthController>().forgot();
          }
        },
        isButtonExpanded: false,
        isUsedButton: true,
      );
  }

  _titleText(context) {
    return titleTextLayout(
        context: context,
        titleText: "Forget Password",
        subTitleText: "Enter your Email Account To Reset",
        subText: "Your Password");
  }

  _resentEmailField() {
    return AppInputField(
      title: "Email Address",
      hint: "Enter email address",
      isFieldTitleHide: true,
      controller: restPasswordController,
      isFieldElevationHide: true,
      validator: (value) {
        if (value!.isEmpty) {
          return AppString
              .the_email_field_is_required;
        } else if (value.isEmpty ||
            !RegExp(emailExp()).hasMatch(value)) {
          showErrorMessage(message:AppString.please_remove_space_address);
          return AppString
              .please_insert_a_valid_email_address;
        } else {
          return null;
        }
      },
    );
  }
}
