import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_let_mobile_app/common/widgets/cutom_component/custom_title_text.dart';
import 'package:to_let_mobile_app/models/main/profile/view/widget/post_list_widget.dart';
import '../../../../../common/widgets/custom_dialog.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../common/widgets/custom_spacer.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_layout.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../home/view/widget/card_style.dart';
import '../../controller/profile_controller.dart';
import '../widget/profile_appbar.dart';
import '../widget/sectionInfoLayout.dart';




class ProfileScreen extends GetView<ProfileController> {
   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,

      appBar: profileAppbar(
        onAction: () => ZoomDrawer.of(context)?.toggle(),
        context: context,
      ),
      body: Padding(
        padding: marginLayout.copyWith(left: 12, right: 12),
        child: RefreshIndicator(
          onRefresh: _refreshPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _userInfoLayout(
                context: context,
                imgUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTljNxaJeX5ZRS3t9wgRC2GQ0xJHlOmGLinYnz4RS2y3Gnmhb6BcxQJzDvwU-PWfVfXXFs&usqp=CAU",
                name: "Rifat Al Hasan",
                email: "rfatal@gmail.com",
              ),
              customSpacerHeight(height:12 ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myPostsTitleText(text: "My posts"),

              ),
              const Expanded(child: MyPostsWidget())

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refreshPage() async {}

  Widget _userInfoLayout({
    required String name,
    required String email,
    required BuildContext context,
    required String imgUrl,
  }) {
    return GestureDetector(
      onTap: _updateEditProfileAccordingToResponse,
      child: Row(
        children: [
          CustomNetworkImage(imgUrl: imgUrl),
          customSpacerWidth(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyle.mid_large_text
                    .copyWith(color: AppColor.normalTextColor),
              ),
              Text(
                email,
                style: AppStyle.normal_text_grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _oderStatusLayout() {
    return Card(
      elevation: 0,
      color: AppColor.primaryColor,
      shape: roundedRectangleBorder,
      child: _infoTextLayout(
        dynamicText: "MY Posts",
        onAction: () => Get.toNamed(Routes.ORDER),
      ),
    );
  }

  Widget _infoTextLayout({
    required String dynamicText,
    required VoidCallback onAction,
  }) {
    return InkWell(
      onTap: onAction,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: AppColor.cardColor,
                size: 20,
              ),
              customSpacerWidth(width: 4),
              Text(
                dynamicText,
                maxLines: 1,
                style: AppStyle.normal_text_grey.copyWith(
                  color: AppColor.cardColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _logoutLayout(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(70),
      width: double.infinity,
      color: AppColor.secondaryColor,
      child: InkWell(
        onTap: () {
          customDialog(
            context: context,
            saveBtnAction: () {},
            icon: Icons.logout,
            titleText: AppString.text_are_you_sure_log_out.tr,
            subText: AppString.text_are_you_sure_want_to_exit_from_app.tr,
            iconBgColor: AppColor.errorColorLight,
            btnBgColor: AppColor.errorColorLight,
            btnText: AppString.text_log_out.tr,
            widget: Obx(() => _logoutText()),
            drcText: "",
          );
        },
        child: Row(
          children: [
            customSpacerWidth(width: 12),
            const Icon(
              Icons.logout,
              color: AppColor.cardColor,
            ),
            customSpacerWidth(width: 8),
            Text(
              AppString.text_log_out.tr,
              textAlign: TextAlign.center,
              style:
              AppStyle.mid_large_text.copyWith(color: AppColor.cardColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoutText() {
    return Text(
      "Logout",
      style: AppStyle.normal_text.copyWith(
        color: AppColor.cardColor,
        fontSize: Dimensions.fontSizeMid - 3,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  void _getApiResponse() {
    if (GetStorage().read(AppString.ACCESS_TOKEN) == null) {
      Get.offNamed(Routes.SIGN_IN);
    }
  }

  void _updateEditProfileAccordingToResponse() {
    Get.toNamed(Routes.EDIT_PROFILE_SCREEN);
  }
}
