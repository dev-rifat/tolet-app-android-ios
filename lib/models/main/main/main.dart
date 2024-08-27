import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidable/hidable.dart';
import 'package:to_let_mobile_app/models/main/home/controller/home_controller.dart';
import 'package:to_let_mobile_app/models/main/main/widgets.dart';
import 'package:to_let_mobile_app/models/main/properties/controller/properties_controller.dart';
import '../../../init_ app.dart';
import '../../../utils/app_color.dart';
import '../../statring/controller/splash_controller.dart';

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
                Get.find<HomeController>().isSelectCategory.value=0;
                if(index==1){
                  Get.find<PropertiesController>().getProperties(categoryId: "0");
                }

              }),
            ),
          ),
        ));
  }

  void _initialController() async {
  }
}
