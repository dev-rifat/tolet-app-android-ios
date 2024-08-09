import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/models/main/home/model/categories_model.dart' as cat;
import 'package:to_let_mobile_app/models/main/properties/controller/properties_controller.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/loading_effect/shimmer.dart';
import '../../controller/home_controller.dart';

class CategoryList extends GetView<HomeController> {
  const CategoryList({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: controller.obx((state) {
        // Create a new list with the "All" category at the beginning
        final categories = [
          cat.Data(id: 0, name: "All"), // Assuming CategoryModel is the model class
          ...?controller.categoriesModel.data
        ];

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            var category = categories[index];
            return Obx(() => GestureDetector(
              onTap: () {
                controller.isSelectCategory.value = index;
                Get.find<PropertiesController>().getProperties(
                    categoryId: category.id
                );
              },
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: controller.isSelectCategory.value == index
                        ? decoration
                        : BoxDecoration(
                        color: AppColor.cardColor,
                        borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 14),
                        child: Text(
                          category.name??"",
                          style: AppStyle.normal_text.copyWith(
                            color: controller.isSelectCategory.value == index
                                ? AppColor.cardColor
                                : AppColor.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
          },
        );
      }, onLoading: const ShimmerListEffect()),
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
