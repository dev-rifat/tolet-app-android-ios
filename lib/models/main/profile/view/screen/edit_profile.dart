import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/controller/file_upload_controller.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../common/widgets/custom_spacer.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_layout.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../../auth/view/widget/auth_view_widget.dart';
import '../../../home/view/widget/card_style.dart';
import '../../controller/profile_controller.dart';
import '../widget/edit_profile_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customInsideAppbar(title: AppString.text_edit_profile.tr),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: marginLayout.copyWith(left: 18, right: 18),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(
                () => _profileSectionLayout(context),
              ),
              customSpacerHeight(height: 30),
              TextFieldLayout()
            ],
          ),
        ),
      ),
    );
  }

  _profileSectionLayout(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Get.find<PikedProfileImgController>()
                .storageForUpload
                .filePath
                .isNotEmpty
            ? CircleAvatar(
                radius: 40,
                backgroundColor: AppColor.disableColor,
                child: CircleAvatar(
                  radius: 39,
                  backgroundColor: AppColor.backgroundColor,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundImage: FileImage(File(
                            Get.find<PikedProfileImgController>()
                                .storageForUpload
                                .filePath
                                .value)
                        .absolute),
                  ),
                ),
              )

            : SizedBox(
          height: 70,
              width: 70,
              child: CustomNetworkImage(
                  imgUrl: "",
                ),
            ),
        customSpacerWidth(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.text_update_your_profile.tr,
              style: AppStyle.mid_large_text
                  .copyWith(color: AppColor.primaryColor),
            ),
            Text(
              AppString.text_upload_a_photo_undar_2mb.tr,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.hintColor,
                  fontSize: Dimensions.fontSizeDefault - 1),
            ),
            customSpacerHeight(height: 8),
            Row(
              children: [
                _uploadBtnLayout()
              ],
            )
          ],
        ),
      ],
    );
  }

  _uploadBtnLayout() {
    return GestureDetector(
      onTap: () {
        // Get.find<PikedProfileImgController>()
        //     .storageForUpload
        //     .pickImage(ImageSource.gallery);
      },
      child: SizedBox(
        height: AppLayout.getHeight(36),
        width: AppLayout.getWidth(100),
        child: Card(
          elevation: 0,
          color: AppColor.primaryOrange,
          shape: roundedRectangleBorder.copyWith(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault-3)),
          child: Center(
            child: Text(
              AppString.text_upload.tr,
              style: AppStyle.mid_large_text
                  .copyWith(fontSize: Dimensions.fontSizeDefault),
            ),
          ),
        ),
      ),
    );
  }
}

customInsideAppbar({String ?title}) {
  return AppBar(
    elevation: 0,
    leading: GestureDetector(
        onTap: () => Get.back(),
        child:  const Icon(
          Icons.arrow_back,
          color:AppColor.normalTextColor,
        )),
    centerTitle: true,
    backgroundColor: Theme.of(Get.context!).backgroundColor,
    title: Text(
      title??  AppString.text_edit_profile.tr,
      style: AppStyle.mid_large_text.copyWith(
          fontSize: Dimensions.fontSizeMid, color:AppColor.normalTextColor,),
    ),
  );
}
