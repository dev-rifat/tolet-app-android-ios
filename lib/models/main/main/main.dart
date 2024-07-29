import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hidable/hidable.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:to_let_mobile_app/models/main/favorite/view/screen/wishlist_screen.dart';
import 'package:to_let_mobile_app/models/main/home/view/screen/home.dart';
import 'package:to_let_mobile_app/models/main/main/widgets.dart';
import 'package:to_let_mobile_app/models/main/profile/view/screen/profile.dart';
import 'package:to_let_mobile_app/models/main/properties/view/screen/properties.dart';
import '../../../utils/app_color.dart';
import '../create_post/view/screen/create_post_screen.dart';
import '../profile/controller/profile_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.routeIndex = 0}) : super(key: key);
  final int? routeIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController controller;
   ScrollController _hideButtonController = ScrollController();



  var _isVisible;
  @override
  initState() {
    super.initState();
    controller = PersistentTabController(
      initialIndex: widget.routeIndex ?? 0,
    );
    _isVisible = true;
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if(_isVisible) {
          setState(() {
            _isVisible = false;
            print("**** $_isVisible up");
          });
        }
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if(!_isVisible) {
          setState(() {
            _isVisible = true;
            print("**** $_isVisible down");
          });
        }
      }
    });
  }



  // @override
  // void dispose() {
  //   _hideButtonController.dispose();
  //   super.dispose();
  // }

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
                hideNavigationBar:! _isVisible,
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
              ),



        ));
  }

  void _initialController() async {
    Get.put(ProfileController());
  }

  _screenListLayout() {
    return [
      const HomeScreen(),
      const PropertiesScreen(),
      const CreatePost(),
      const WishListScreen(),
      const ProfileScreen()
    ];
  }
}
