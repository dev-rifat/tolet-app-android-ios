import 'dart:io';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _HomeState();
}

class _HomeState extends State<MainScreen> {
  int _currentIndex = 0;
  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: _btnNavIcon(icon: CupertinoIcons.home),
          activeIcon: _btnNavIcon(icon: CupertinoIcons.house_fill),
          label: AppString.text_home.tr),
      BottomNavigationBarItem(
          icon: _btnNavIcon(icon: CupertinoIcons.person_alt_circle),
          activeIcon: _btnNavIcon(icon: CupertinoIcons.person_alt_circle_fill),
          label: AppString.text_profile.tr),
      BottomNavigationBarItem(
          icon: _btnNavIcon(icon: CupertinoIcons.person_alt_circle),
          activeIcon: _btnNavIcon(icon: CupertinoIcons.person_alt_circle_fill),
          label: AppString.text_profile.tr),
      BottomNavigationBarItem(
          icon: _btnNavIcon(icon: CupertinoIcons.person_alt_circle),
          activeIcon: _btnNavIcon(icon: CupertinoIcons.person_alt_circle_fill),
          label: AppString.text_profile.tr),
    ];

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: screensLayoutForBtnNav[_currentIndex],
        bottomNavigationBar: Localizations.override(
          context: context,
          child: Wrap(children: [
            BottomNavigationBar(
              selectedItemColor: AppColor.primaryColor,
              backgroundColor: Theme.of(context).cardColor,
              unselectedItemColor: AppColor.hintColor.withOpacity(0.8),
              type: BottomNavigationBarType.fixed,
              selectedFontSize: Dimensions.fontSizeDefault - 1,
              unselectedFontSize: Dimensions.fontSizeDefault - 1,
              showUnselectedLabels: true,
              items: items,
              elevation: 3,
              currentIndex: _currentIndex,
              onTap: (index) => onTap(index),
            )
          ]),
        ),
      ),
    );
  }

  Widget _btnNavIcon({required icon}) {
    return Icon(icon);
  }
}

Future<bool> _onWillPop(BuildContext context) async {
  if (Platform.isAndroid) {
    SystemNavigator.pop();
  } else if (Platform.isIOS) {
    exit(0);
  }
  return false;
}
