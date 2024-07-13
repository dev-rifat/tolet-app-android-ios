import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:to_let_mobile_app/models/main/main/drawer_main/menu_screen.dart';
import 'package:to_let_mobile_app/models/main/main/main.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';

class ZoomMainDrawer extends StatelessWidget {
  const ZoomMainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
      mainScreen: const MainScreen(),
      menuBackgroundColor: AppColor.primaryColor,
      style: DrawerStyle.defaultStyle,
      menuScreen: const DrawerMenuScreen(),
      showShadow: true,
      angle: 0.0,
    );
  }
}
