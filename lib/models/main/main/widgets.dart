import 'dart:io';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../common/widgets/custom_dialog.dart';
import '../create_post/view/screen/create_post_screen.dart';
import '../favorite/view/screen/wishlist_screen.dart';
import '../home/view/screen/home.dart';
import '../profile/view/screen/profile.dart';
import '../properties/view/screen/properties.dart';

Future<bool> get appExitChecker => _onWillPop();

Future<bool> _onWillPop() async {
  return customDialog(
    context: Get.context!,
    saveBtnAction: () {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    },
    icon: Icons.logout,
    titleText: AppString.text_are_you_sure.tr,
    subText: "${AppString.text_are_you_sure_want_to_exit_from_app.tr}.",
    iconBgColor: AppColor.secondaryColor,
    btnBgColor: AppColor.secondaryColor,
    btnText: AppString.text_yes.tr,
    drcText: "",
  );
}

List<TabItem> items = [
  const TabItem(
    icon: CupertinoIcons.house_fill,
  ),
  const TabItem(
    icon: Icons.hotel,
  ),
  const TabItem(
    icon: Icons.add,
  ),
  const TabItem(
    icon: Icons.favorite_border,
  ),
   const TabItem(
    icon: CupertinoIcons.person_alt_circle,
  ),
];


final List<Widget> screenListLayout = [
  const HomeScreen(),
  const PropertiesScreen(),
  const CreatePost(),
   WishListScreen(),
  const ProfileScreen()
];