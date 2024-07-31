import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../common/widgets/custom_dialog.dart';
import '../../../common/widgets/custom_spacer.dart';
import '../../../utils/app_style.dart';

List<PersistentBottomNavBarItem> get iconList => _navBarsItems();
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

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    _navbarIcon(
        activeIcon: CupertinoIcons.house_fill,
        text: "Home",
        inActiveIcon: CupertinoIcons.home,),
    _navbarIcon(
        activeIcon:Icons.hotel,
        text: "Properties",
        inActiveIcon:Icons.hotel_outlined,),


    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add,color: AppColor.cardColor,),

      activeColorPrimary: AppColor.primaryColor,
      inactiveIcon: const Icon(Icons.add,color:  AppColor.cardColor,),
    ),
    _navbarIcon(
      activeIcon:  Icons.favorite,
      text: "Favorite",
      inActiveIcon: Icons.favorite_border,),
    _navbarIcon(
      activeIcon: CupertinoIcons.person_alt,
      text: "Profile",
      inActiveIcon: CupertinoIcons.person,),
  ];
}



PersistentBottomNavBarItem _navbarIcon(
    {required activeIcon, required String text, inActiveIcon}) {

  return PersistentBottomNavBarItem(
    icon: _activeIcon(text, activeIcon),
    inactiveIcon: _inActiveIcon(text, inActiveIcon),
  );
}




_inActiveIcon(text, IconData icon) {
  return SizedBox(
    height: AppLayout.getHeight(25),
    child: Icon(icon,color: AppColor.hintColor,),
  );
}

_activeIcon(text, IconData icon) {
  return SizedBox(
    height: AppLayout.getHeight(25),
    child:  Icon(icon,color: AppColor.primaryColor,),
  );
}