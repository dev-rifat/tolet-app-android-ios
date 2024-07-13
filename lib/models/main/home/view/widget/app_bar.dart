import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../../auth/view/widget/auth_view_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget { // Changed class name to CustomAppBar
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0), // here the desired height
      child: AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
            backgroundColor:Colors.grey.shade100,
        elevation: 0,
        leading: Padding(
          padding: marginLayout.copyWith(top: 12),  // Assuming marginLayout is defined somewhere in your utils
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: AppStyle.normal_text_black.copyWith(color: AppColor.hintColor),
              ),
              Row(
                children: [
                  Text(
                    "Dhaka",
                    style: AppStyle.normal_text_black.copyWith(fontSize: Dimensions.fontSizeMid),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.expand_more,
                      size: 20,
                      color: AppColor.hintColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: marginLayout.copyWith(top: 12),
            child: const Icon(CupertinoIcons.bell),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
