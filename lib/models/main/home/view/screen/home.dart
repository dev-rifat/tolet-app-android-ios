import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/auth/view/widget/auth_view_widget.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/home_view_widgets.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: marginLayout.copyWith(left: 12, right: 12),
        child: Column(
          children: [
            ///Search layout
            _buildSearchLayout(),



          ],
        ),
      ),
    );
  }

  _buildSearchLayout() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColor.hintColor.withOpacity(0.2),
              shape: roundedRectangleBorder.copyWith(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                     const Icon(CupertinoIcons.search,color: AppColor.normalTextColor,),
                    customSpacerWidth(width: 8),
                    Text(
                      "Search",
                      style: AppStyle.normal_text_black
                          .copyWith(fontSize: Dimensions.fontSizeDefault + 2,color: AppColor.normalTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 50,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
