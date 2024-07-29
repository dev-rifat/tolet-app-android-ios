import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../home/view/widget/category_list.dart';
import '../widgets/post_list_widget.dart';
class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor:Colors.grey.shade100,
        actions: [
          GestureDetector(
              
              onTap: ()=>Get.toNamed(Routes.SEARCH_SCREEN),
              child: const Icon(CupertinoIcons.search)),
          customSpacerWidth(width: 12),
        ],
        title: Text("Properties",style: AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid),),),
      body: Padding(
        padding: marginLayout.copyWith(left: 8,right: 8),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: CategoryList(),
            ),
            customSpacerHeight(height: 14),
             PostListWidget(),
            customSpacerHeight(height: 14),

          ],
        ),
      ),

    );
  }
}

