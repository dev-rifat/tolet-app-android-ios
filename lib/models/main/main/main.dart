import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:to_let_mobile_app/models/main/main/widgets.dart';
import '../../../utils/app_color.dart';

ScrollController hideButtonController = ScrollController();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.routeIndex = 0}) : super(key: key);
  final int? routeIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int visit = 0;

  @override
  initState() {
    super.initState();
    visit = widget.routeIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    /// initialController controller
    _initialController();

    return WillPopScope(
        onWillPop: () => appExitChecker,
        child: Scaffold(
          body: screenListLayout[visit],
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
}
