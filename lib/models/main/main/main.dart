import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:to_let_mobile_app/models/main/home/view/screen/home.dart';
import 'package:to_let_mobile_app/models/main/main/widgets.dart';
import 'package:to_let_mobile_app/models/main/profile/view/screen/profile.dart';
import 'package:to_let_mobile_app/models/main/properties/view/screen/properties.dart';
import '../../../utils/app_color.dart';
import '../profile/controller/profile_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.routeIndex = 0}) : super(key: key);
  final int? routeIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController controller;

  @override
  void initState() {
    controller = PersistentTabController(
      initialIndex: widget.routeIndex ?? 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// initialController controller
    _initialController();

    return WillPopScope(
        onWillPop: () => appExitChecker,
        child: Scaffold(
            body: PersistentTabView(
          context,
          controller: controller,
          screens: _screenListLayout(),
          items: iconList,
          backgroundColor: AppColor.backgroundColor,
          confineInSafeArea: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(1.0),
            colorBehindNavBar: Colors.white,
          ),
          navBarStyle: NavBarStyle.style15,
          navBarHeight: 60,
          hideNavigationBarWhenKeyboardShows: true,
          onItemSelected: (value) {
            print(controller.index == value);
          },
        )));
  }

  void _initialController() async {
     Get.put(ProfileController());
  }

  _screenListLayout() {
    return [
      const HomeScreen(),
      const PropertiesScreen(),
      Container(),
      const HomeScreen(),
      const ProfileScreen(),
    ];
  }
}
