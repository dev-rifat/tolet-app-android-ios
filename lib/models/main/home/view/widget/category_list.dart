import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';

import '../../controller/home_controller.dart';

class CategoryList extends GetView<HomeController> {
   CategoryList({super.key});

final  List categoryList =["Home","Ded","Home","Test","Home","Home","Ded","Home","Test","Home"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
            onTap: (){
              controller.isSelectCategory.value=index;
            },
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: controller.isSelectCategory.value==index?
                  decoration:BoxDecoration(
                    color: AppColor.cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),

                  ),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 14),
                        child: Text(
                          categoryList[index],
                          style: AppStyle.normal_text
                              .copyWith(color:controller.isSelectCategory.value==index? AppColor.cardColor:AppColor.primaryColor,

                          fontWeight: FontWeight.w700
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}

Decoration get decoration {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.primaryColor.withOpacity(0.5),
        AppColor.primaryColor,
        AppColor.primaryColor,
        AppColor.primaryColor,
      ],
    ),
  );
}
