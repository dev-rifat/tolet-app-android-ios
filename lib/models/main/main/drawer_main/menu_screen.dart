import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/profile/controller/profile_controller.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../common/widgets/custom_dialog.dart';
import '../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../utils/app_string.dart';

class DrawerMenuScreen extends StatelessWidget {
  const DrawerMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: marginLayout.copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            ///For only profile info
           _buildProfileInformation(),
           customSpacerHeight(height: 20),



            _buildWidget(text: "Wishlist",icon: Icons.favorite_border,onAction: ()=>Get.toNamed(Routes.FAVORITE)),
            Divider(color: AppColor.cardColor.withOpacity(0.3)),

            _buildWidget(text: "Change password",icon: CupertinoIcons.lock,onAction: ()=>Get.toNamed(Routes.CAHANGE_PASSWORD)),
            Divider(color: AppColor.cardColor.withOpacity(0.3)),

            _buildWidget(text: "Edit profile",icon: Icons.image_outlined,onAction: ()=>Get.toNamed(Routes.EDIT_PROFILE_SCREEN)),
            Divider(color: AppColor.cardColor.withOpacity(0.3),),

            _buildWidget(text: "Help?",icon: CupertinoIcons.headphones,onAction: ()=>Get.toNamed(Routes.MAIN)),
            customSpacerHeight(height: 20),

          _logout(),

            const Spacer(flex: 2,),

          ],
        ),
      ),
    );
  }

  _buildProfileInformation() {
    var controller=Get.find<ProfileController>();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(imgUrl: controller.profileModel.value.data?.image??"",),

        SizedBox(
          width: 80,
          child: Card(
            elevation: 0,
            color: AppColor.primaryOrange,
            child: Center(child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("Update",style: AppStyle.normal_text_black.copyWith(color: AppColor.cardColor),),
            )),),
        ),
       Obx(() =>  Text(
         controller.profileModel.value.data?.name??"Guest",
         style: AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid+5,color: AppColor.cardColor),
       ),)

      ],
    );

  }

  _buildWidget({required String text,required IconData icon ,onAction}) {
    return GestureDetector(
      onTap: onAction,
      child: Padding(
        padding:  const EdgeInsets.only(top: 12.0,bottom: 12),
        child: Row(
          children: [
             Icon(icon,size: 20,color:Colors.black,),
            customSpacerWidth(width: 8),
            Text(text,style: AppStyle.normal_text_black.copyWith(fontWeight: FontWeight.w700,fontSize: Dimensions.fontSizeMid-2,color: Colors.black),),
          ],
        ),
      ),
    );
  }

  _logout() {
    return   GestureDetector(
      onTap: ()=>_logoutDialog(),
      child: SizedBox(
        width: 80,
        child: Card(
          elevation: 0,
          shape: roundedRectangleBorder.copyWith(side: const BorderSide(width: 1,color: AppColor.errorColor)),
          color: Colors.red,
          child: Center(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("Logout",style: AppStyle.normal_text_black.copyWith(color: AppColor.cardColor),),
          )),),
      ),
    );
  }
}

_logoutDialog(){
   customDialog(
    context: Get.context!,
    saveBtnAction: () {
      Get.offAllNamed(Routes.SIGN_IN);
      GetStorage().remove(AppString.ACCESS_TOKEN);
      GetStorage().remove(AppString.ID_STORE);
    },
    icon: Icons.logout,
    titleText: AppString.text_are_you_sure.tr,
    subText: "${AppString.text_are_you_sure_want_to_exit_from_app.tr.replaceAll("exit", "logout")}.",
    iconBgColor: AppColor.errorColor,
    btnBgColor: AppColor.errorColor,
    btnText: AppString.text_yes.tr,
    drcText: "",
  );
}