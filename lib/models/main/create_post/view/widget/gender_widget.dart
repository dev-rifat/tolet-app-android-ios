import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';

import '../../../home/controller/home_controller.dart';
import '../../../home/view/widget/category_list.dart';


class GenderList extends GetView<HomeController> {
  GenderList({super.key});

  final  List categoryList =["Male","Female","Others"];
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
              controller.isSelectGender.value=index;
            },
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: controller.isSelectGender.value==index?
                  _decoration:BoxDecoration(
                    color: AppColor.cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),

                  ),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 14),
                        child: Text(
                          categoryList[index],
                          style: AppStyle.normal_text
                              .copyWith(color:controller.isSelectGender.value==index? AppColor.cardColor:AppColor.primaryOrange,

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

Decoration get _decoration {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.primaryOrange.withOpacity(0.5),
        AppColor.primaryOrange,
        AppColor.primaryOrange,
        AppColor.primaryOrange,
      ],
    ),
  );
}