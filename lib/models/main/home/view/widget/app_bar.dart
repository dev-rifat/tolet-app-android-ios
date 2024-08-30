import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/common/widgets/loading_effect/circle_loading.dart';
import 'package:to_let_mobile_app/models/main/home/model/division_list_model.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../controller/home_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller = Get.find<HomeController>();

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      leadingWidth: MediaQuery.of(context).size.width,
      leading: Padding(
        padding: marginLayout.copyWith(top: 5, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationDropdown(),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: marginLayout.copyWith(top: 5),
          child: const Icon(CupertinoIcons.bell),
        ),
      ],
    );
  }

  Widget _buildLocationDropdown() {
    return Obx(() {
      return DropdownButton<String>(
        value: controller.selectedDivision.value.isNotEmpty ? controller.selectedDivision.value : null,
        onChanged: (newValue) {
          if (newValue != null) {
            controller.setSelectedDivision(newValue);
          }
        },
        underline: Container(),
        hint: const Text("Location"),
        style: AppStyle.normal_text_black.copyWith(fontSize: 14),
        padding: EdgeInsets.zero,
        icon: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(Icons.expand_more, color: AppColor.hintColor),
        ),
        items: controller.divisionList.map<DropdownMenuItem<String>>((Data value) {
          return DropdownMenuItem<String>(
            value: value.name,
            child: Row(
              children: [
                controller.isLoadingLocation.value
                    ? Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: loadingIndicator(width: 10, height: 10),
                )
                    : Icon(Icons.location_on, size: 16, color: AppColor.primaryColor),
                customSpacerWidth(width: 8),
                Text(value.name ?? "", style: AppStyle.normal_text_black.copyWith(fontSize: 15)),
              ],
            ),
          );
        }).toList(),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
