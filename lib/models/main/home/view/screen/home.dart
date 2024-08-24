import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/custom_title_text.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../../routes/app_pages.dart';
import '../../../main/main.dart';
import '../widget/app_bar.dart';
import '../widget/best_for_you.dart';
import '../widget/category_list.dart';
import '../widget/near_for_you.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(),
      backgroundColor:Colors.grey.shade100,
      body: Padding(
        padding: marginLayout.copyWith(left: 12, right: 12),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: hideButtonController,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Search layout
              _buildSearchLayout(context),

              customSpacerHeight(height: 22),

              ///Title text (Near for you)
              buildCustomTitleText(text: "Near for you"),
              customSpacerHeight(height: 14),

              ///Near for you image list
              const NearForYou(),
              customSpacerHeight(height: 14),

              ///Title text (Near for you)
              buildCustomTitleText(text: "Best for you"),
              customSpacerHeight(height: 14),
              const BestForYou()
            ],
          ),
        ),
      ),
    );
  }

  _buildSearchLayout(context) {
    return Row(
      children: [


        Expanded(
          child: GestureDetector(
            onTap: ()=>Get.toNamed(Routes.SEARCH_SCREEN),
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
                      const Icon(
                        CupertinoIcons.search,
                        color: AppColor.normalTextColor,
                      ),
                      customSpacerWidth(width: 8),
                      Text(
                        "Search",
                        style: AppStyle.normal_text_black.copyWith(
                            fontSize: Dimensions.fontSizeDefault + 2,
                            color: AppColor.normalTextColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            ZoomDrawer.of(context)?.toggle();
          },
          child: Container(
            width: 50,
            decoration: decoration,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
