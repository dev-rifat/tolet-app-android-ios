import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/common/widgets/cutom_component/margin_layout.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/custom_app_bar.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../../home/view/widget/category_list.dart';
import '../../../main/main.dart';
import '../../controller/create_post_controller.dart';
import '../widget/add_facility.dart';
import '../widget/gender_widget.dart';
import '../widget/multi_image_pikar.dart';
import '../widget/text_field_widgets.dart';

class CreatePost extends StatelessWidget {
  CreatePost({super.key});

  final CreatePostController createPostController =
      Get.put(CreatePostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: customAppBar(
          text: "Create post",
          prefix: Card(
              elevation: 0,
              color: AppColor.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12, top: 4, bottom: 4),
                child: Text(
                  "Create",
                  style:
                      AppStyle.normal_text.copyWith(color: AppColor.cardColor),
                ),
              ))),
      body: Padding(
        padding: marginLayout,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: hideButtonController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSpacerHeight(height: 20),
              const CategoryList(),
              customSpacerHeight(height: 20),
              postTitleTextField(),
              customSpacerHeight(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: AppColor.hintColor.withOpacity(0.7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 8, bottom: 6, top: 6),
                        child: Obx(() {
                          return DropdownButton<String>(
                            value:
                                createPostController.selectedValue.value.isEmpty
                                    ? null
                                    : createPostController.selectedValue.value,
                            hint: Text(
                              "Bed room",
                              style: AppStyle.normal_text_black.copyWith(
                                  color:
                                      AppColor.normalTextColor.withOpacity(0.5),
                                  fontSize: Dimensions.fontSizeDefault + 1),
                            ),
                            onChanged: (newValue) {
                              createPostController.setSelected(newValue!);
                            },
                            underline: Container(),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(8),
                            style: AppStyle.normal_text_black
                                .copyWith(fontSize: 14),
                            icon: Icon(
                              Icons.expand_more,
                              color: AppColor.normalTextColor.withOpacity(0.5),
                            ),
                            items: createPostController.items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    Icon(Icons.bed,
                                        size: 18,
                                        color: AppColor.normalTextColor
                                            .withOpacity(0.5)),
                                    customSpacerWidth(width: 12),
                                    Text(
                                      value,
                                      style: AppStyle.normal_text_black
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }),
                      ),
                    ),
                  ),
                  customSpacerWidth(width: 20),
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: AppColor.hintColor.withOpacity(0.7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 8, bottom: 6, top: 6),
                        child: Obx(() {
                          return DropdownButton<String>(
                            value: createPostController
                                    .selectedBathRoomValue.value.isEmpty
                                ? null
                                : createPostController
                                    .selectedBathRoomValue.value,
                            hint: Text(
                              "Bath room",
                              style: AppStyle.normal_text_black.copyWith(
                                  color:
                                      AppColor.normalTextColor.withOpacity(0.5),
                                  fontSize: Dimensions.fontSizeDefault + 1),
                            ),
                            onChanged: (newValue) {
                              createPostController
                                  .setSelectedBathRoom(newValue!);
                            },
                            isExpanded: true,
                            underline: Container(),
                            style: AppStyle.normal_text_black
                                .copyWith(fontSize: 14),
                            icon: Icon(
                              Icons.expand_more,
                              color: AppColor.normalTextColor.withOpacity(0.5),
                            ),
                            items: createPostController.bathRoomItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    Icon(Icons.shower_outlined,
                                        size: 18,
                                        color: AppColor.normalTextColor
                                            .withOpacity(0.5)),
                                    customSpacerWidth(width: 12),
                                    Text(
                                      value,
                                      style: AppStyle.normal_text_black
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              customSpacerHeight(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: AppColor.hintColor.withOpacity(0.7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 8, bottom: 6, top: 6),
                        child: Obx(() {
                          return DropdownButton<String>(
                            value: createPostController
                                    .selectedVarandaValue.value.isEmpty
                                ? null
                                : createPostController
                                    .selectedVarandaValue.value,
                            hint: Text(
                              "Varanda",
                              style: AppStyle.normal_text_black.copyWith(
                                  color:
                                      AppColor.normalTextColor.withOpacity(0.5),
                                  fontSize: Dimensions.fontSizeDefault + 1),
                            ),
                            onChanged: (newValue) {
                              createPostController
                                  .setSelectedVadanda(newValue!);
                            },
                            underline: Container(),
                            isExpanded: true,
                            style: AppStyle.normal_text_black
                                .copyWith(fontSize: 14),
                            icon: Icon(
                              Icons.expand_more,
                              color: AppColor.normalTextColor.withOpacity(0.5),
                            ),
                            items: createPostController.items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    Icon(Icons.window,
                                        size: 18,
                                        color: AppColor.normalTextColor
                                            .withOpacity(0.5)),
                                    customSpacerWidth(width: 12),
                                    Text(
                                      value,
                                      style: AppStyle.normal_text_black
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }),
                      ),
                    ),
                  ),
                  customSpacerWidth(width: 20),
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: AppColor.hintColor.withOpacity(0.7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 8, bottom: 6, top: 6),
                        child: Obx(() {
                          return DropdownButton<String>(
                            value: createPostController
                                    .selectedFloorValue.value.isEmpty
                                ? null
                                : createPostController.selectedFloorValue.value,
                            hint: Text(
                              "Floor no",
                              style: AppStyle.normal_text_black.copyWith(
                                  color:
                                      AppColor.normalTextColor.withOpacity(0.5),
                                  fontSize: Dimensions.fontSizeDefault + 1),
                            ),
                            onChanged: (newValue) {
                              createPostController.setSelectedFloor(newValue!);
                            },
                            isExpanded: true,
                            underline: Container(),
                            style: AppStyle.normal_text_black
                                .copyWith(fontSize: 14),
                            icon: Icon(
                              Icons.expand_more,
                              color: AppColor.normalTextColor.withOpacity(0.5),
                            ),
                            items: createPostController.bathRoomItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    Icon(Icons.flood_rounded,
                                        size: 18,
                                        color: AppColor.normalTextColor
                                            .withOpacity(0.5)),
                                    customSpacerWidth(width: 12),
                                    Text(
                                      value,
                                      style: AppStyle.normal_text_black
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              customSpacerHeight(height: 20),
              GenderList(),
              customSpacerHeight(height: 20),
              rentTextField(),
              customSpacerHeight(height: 20),
              additionalPhoneNumberTextField(),
              customSpacerHeight(height: 20),
              whatAppNumberTextField(),
              customSpacerHeight(height: 20),
              const AddFacility(),
              customSpacerHeight(height: 20),
              descriptionTextField(),
              customSpacerHeight(height: 20),

              customSpacerHeight(height: 20),
               MultiImagePickerExample(),
              customSpacerHeight(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}

