import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/controller/input_controller.dart';
import '../../../../../common/widgets/custom_spacer.dart';
import '../../../../../common/widgets/cutom_component/cutom_input_field.dart';
import '../../../../../common/widgets/warning_message.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../home/view/widget/card_style.dart';
import '../../controller/create_post_controller.dart';

class AddFacility extends StatelessWidget {
  const AddFacility({super.key});

  @override
  Widget build(BuildContext context) {
    addFacilityController.clear();
    return Obx(() => Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomInputField(
                hitText: "Add facility",
                controller: addFacilityController,
                hintStyle: AppStyle.normal_text_black.copyWith(
                  color: AppColor.hintColor,
                  fontSize: Dimensions.fontSizeDefault + 1,
                ),
              ),
            ),
            customSpacerWidth(width: 12),
            GestureDetector(
              onTap: () {
                if (addFacilityController.text.isNotEmpty) {
                  Get.find<CreatePostController>().facilityList.add(
                      "\"${addFacilityController.text.toUpperCase()}\"");
                } else {
                  showWarningMessage(
                      message: "Add color field is required !");
                }
                if (    Get.find<CreatePostController>().facilityList.isNotEmpty) {
                  addFacilityController.clear();
                }
              },
              child: Container(
                height: 62,
                width: 70,
                decoration: _buttonStyle(),
                child: Center(
                    child: Text(
                      "Add",
                      style: AppStyle.normal_text.copyWith(
                          color: AppColor.cardColor,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14),
                    )),
              ),
            )
          ],
        ),
        customSpacerHeight(height: 12),
        Get.find<CreatePostController>().facilityList.isEmpty
            ? const SizedBox.shrink()
            : Obx(() => SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:          Get.find<CreatePostController>().facilityList.length,
            itemBuilder: (context, index) {
              return Card(
                shape: roundedRectangleBorder.copyWith(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0,
                color: AppColor.successColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 2),
                  child: Center(
                      child: Row(
                        children: [
                          Text(
                            Get.find<CreatePostController>().facilityList[index].replaceAll("\"", ""),
                            style: AppStyle.normal_text_grey
                                .copyWith(overflow: TextOverflow.ellipsis,color: AppColor.cardColor),
                          ),
                          customSpacerWidth(width: 4),
                          GestureDetector(
                              onTap: () {
                                Get.find<CreatePostController>().facilityList.removeAt(index);
                              },
                              child: Card(
                                  color: AppColor.disableColor,
                                  shape: roundedRectangleBorder.copyWith(
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.close,
                                      size: 15,
                                    ),
                                  )))
                        ],
                      )),
                ),
              );
            },
          ),
        )),
      ],
    ));
  }
}
_buttonStyle() {
  return BoxDecoration(
      color: AppColor.primaryColor, borderRadius: BorderRadius.circular(6));
}
