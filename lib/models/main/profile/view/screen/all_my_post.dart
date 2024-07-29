import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/models/main/profile/view/widget/post_list_widget.dart';
import '../../../../../common/widgets/custom_spacer.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../home/controller/home_controller.dart';


class MyPosts extends GetView<HomeController> {
   const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        actions: [
          Obx(() {
            return DropdownButton<String>(
              value: controller.selectedValue.value,
              onChanged: (newValue) {
                controller.setSelected(newValue!);
              },
              underline: Container(),
              style: AppStyle.normal_text_black.copyWith(fontSize: 14),
              icon: const Icon(Icons.expand_more),
              items: controller.items
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: AppStyle.normal_text_black.copyWith(fontSize: 15),),
                );
              }).toList(),
            );
          }),
          customSpacerWidth(width: 30),
        ],
        title: Text(
          "My posts",
          style: AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 8,right: 8,top: 12.0,bottom: 0),
        child: MyPostsWidget(),
      ),
    );
  }
}
