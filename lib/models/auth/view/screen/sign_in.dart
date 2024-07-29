import 'package:to_let_mobile_app/models/auth/view/widget/sign_in_widget.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/widgets/custom_onloading.dart';
import '../../../../common/widgets/custom_spacer.dart';
import '../../../../common/widgets/cutom_component/custom_app_buttom.dart';
import '../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../controller/auth_controller.dart';
import '../widget/common_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("SignInScreen_called");
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: marginLayout,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///TitleText
                  _titleText(context),
                  customSpacerHeight(height: 30),
                  ///TextField body
                   const TextFieldLayout(),
                  ///Forgot password
                  recoveryPassword(),
                  customSpacerHeight(height: 30),
                  ///Login button
                  Obx(() => _loginButtonLayout()),
                  customSpacerHeight(height: 24),
                  ///For guest button
                  guestButtonLayout(),
                  customSpacerHeight(height: 30),

                  ///For new register
                 _newUserCreate(context),
                  customSpacerHeight(height: 76),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _loginButtonLayout() {
    return CustomAppButton(
      text: "Login",
      widget: Get.find<AuthController>().isSignInLoading.value
          ? onLoading(color: AppColor.cardColor, isSize: .8)
          : Text(
              "Login",
              style: AppStyle.mid_large_text,
            ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.find<AuthController>().logIn();
          GetStorage().write(AppString.USER_EMAIL, emailController.text);
        }
      },
      buttonRadius: Dimensions.radiusDefault,
      buttonColor: AppColor.primaryColor,
    );
  }

  _titleText(context) {
    return titleTextLayout(
        titleText: "Sign in\nto your account",
        subText: "",
        context: context,
        subTitleText: "Welcome Back You've Been Missed!");
  }

  _newUserCreate(context) {
    return  createUserAccount(
        context: context,
        firstText: "New user? ",
        endText: AppString.text_sign_up,
        onAction: (){
          clearAuthTextField();
          Get.toNamed(Routes.SIGN_UP);
        }


    );
  }
}
