import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:to_let_mobile_app/models/main/favorite/view/screen/wishlist_screen.dart';
import 'package:to_let_mobile_app/models/main/home/view/screen/home.dart';
import 'package:to_let_mobile_app/models/main/main/widgets.dart';
import 'package:to_let_mobile_app/models/main/profile/view/screen/profile.dart';
import 'package:to_let_mobile_app/models/main/properties/view/screen/properties.dart';
import '../../../utils/app_color.dart';
import '../create_post/view/screen/create_post_screen.dart';

ScrollController hideButtonController = ScrollController();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.routeIndex = 0}) : super(key: key);
  final int? routeIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController controller;

  int visit = 0;
  double height = 30;

  @override
  initState() {
    super.initState();
    controller = PersistentTabController(
      initialIndex: widget.routeIndex ?? 0,
    );
  }

  final List<Widget> _screenListLayout = [
    const HomeScreen(),
    const PropertiesScreen(),
    const CreatePost(),
    const WishListScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    /// initialController controller
    _initialController();

    return WillPopScope(
        onWillPop: () => appExitChecker,
        child: Scaffold(
          // body: PersistentTabView(
          //     context,
          //     controller: controller,
          //     screens: _screenListLayout(),
          //     items: iconList,
          //     backgroundColor: AppColor.backgroundColor,
          //     confineInSafeArea: true,
          //     decoration: NavBarDecoration(
          //       borderRadius: BorderRadius.circular(1.0),
          //       colorBehindNavBar: Colors.white,
          //     ),
          //     navBarStyle: NavBarStyle.style15,
          //     navBarHeight: 55,
          //     hideNavigationBarWhenKeyboardShows: true,
          //     onItemSelected: (value) {
          //       print(controller.index == value);
          //     },
          //   ),

          body:_screenListLayout[visit],


          bottomNavigationBar: Hidable(
            controller: hideButtonController,
            enableOpacityAnimation: true,
            child: BottomBarCreative(
              items: items,
              backgroundSelected: AppColor.primaryColor,
             paddingVertical: 12,

              backgroundColor: Colors.white,
              iconSize: 25,
              color: AppColor.hintColor,
              colorSelected: AppColor.primaryColor,
              enableShadow: true,
              indexSelected: visit,
              onTap: (int index) => setState(() {
                visit = index;
              }),
            ),
          ),
        ));
  }

  void _initialController() async {
    //  Get.put(ProfileController());
  }

  List<TabItem> items = [
    TabItem(
      icon: CupertinoIcons.house_fill,
    ),
    TabItem(
      icon: Icons.hotel,
    ),
    TabItem(
      icon: Icons.add,
    ),
    TabItem(
      icon: Icons.favorite_border,
    ),
    TabItem(
      icon: CupertinoIcons.person_alt_circle,
    ),
  ];

//   _screenListLayout() {
//     return [
//       const HomeScreen(),
//       const PropertiesScreen(),
//       const CreatePost(),
//       const WishListScreen(),
//       const ProfileScreen()
//     ];
//   }



 }

