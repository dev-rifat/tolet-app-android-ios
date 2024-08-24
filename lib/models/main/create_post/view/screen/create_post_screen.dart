import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/common/widgets/cutom_component/margin_layout.dart';
import 'package:to_let_mobile_app/common/widgets/warning_message.dart';
import 'package:to_let_mobile_app/models/main/create_post/model/district_model.dart'as dis;
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/custom_app_bar.dart';
import '../../../../../common/widgets/loading_effect/circle_loading.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_style.dart';
import '../../../home/view/widget/category_list.dart';
import '../../../main/main.dart';
import '../../controller/create_post_controller.dart';
import '../../controller/multi_image_pic_controller.dart';
import '../../model/cilty_list_model.dart';
import '../widget/add_facility.dart';
import '../widget/gender_widget.dart';
import '../widget/multi_image_pikar.dart';
import '../widget/text_field_widgets.dart';
import 'no_auth.dart';


class CreatePost extends StatelessWidget {
  CreatePost({super.key});

  final CreatePostController createPostController =
      Get.put(CreatePostController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(CreatePostController());
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: _appbar(),
        body: Padding(
          padding: marginLayout,
          child: GetStorage().read(AppString.ACCESS_TOKEN) == null
              ? const NoAuth()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: hideButtonController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customSpacerHeight(height: 20),
                      const CategoryList(),
                      customSpacerHeight(height: 20),
                      _districtList(),
                      customSpacerHeight(height: 20),
                      _cityList(),
                      customSpacerHeight(height: 20),
                      postTitleTextField(),
                      customSpacerHeight(height: 20),
                      Row(
                        children: [
                          Expanded(child: Text("Bed room",style: AppStyle.small_text_black.copyWith(fontSize: 14,color: AppColor.normalTextColor.withOpacity(0.6)),)),
                          customSpacerWidth(width: 24),
                          Expanded(child: Text("Bath room",style: AppStyle.small_text_black.copyWith(fontSize: 14,color: AppColor.normalTextColor.withOpacity(0.6)),)),


                        ],
                      ),
                      customSpacerHeight(height: 4),

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
                                            .selectedBedRoomValue.value.isEmpty
                                        ? null
                                        : createPostController
                                            .selectedBedRoomValue.value,
                                    hint: Text(
                                      "Bed room",
                                      style: AppStyle.normal_text_black
                                          .copyWith(
                                              color: AppColor.normalTextColor
                                                  .withOpacity(0.5),
                                              fontSize:
                                                  Dimensions.fontSizeDefault +
                                                      1),
                                    ),
                                    onChanged: (newValue) {
                                      createPostController
                                          .setSelected(newValue!);
                                    },
                                    underline: Container(),
                                    isExpanded: true,
                                    borderRadius: BorderRadius.circular(8),
                                    style: AppStyle.normal_text_black
                                        .copyWith(fontSize: 14),
                                    icon: Icon(
                                      Icons.expand_more,
                                      color: AppColor.normalTextColor
                                          .withOpacity(0.5),
                                    ),
                                    items: createPostController.items
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                                      style: AppStyle.normal_text_black
                                          .copyWith(
                                              color: AppColor.normalTextColor
                                                  .withOpacity(0.5),
                                              fontSize:
                                                  Dimensions.fontSizeDefault +
                                                      1),
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
                                      color: AppColor.normalTextColor
                                          .withOpacity(0.5),
                                    ),
                                    items: createPostController.bathRoomItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                          Expanded(child: Text("Varanda",style: AppStyle.small_text_black.copyWith(fontSize: 14,color: AppColor.normalTextColor.withOpacity(0.6)),)),
                          customSpacerWidth(width: 24),
                          Expanded(child: Text("Floor no.",style: AppStyle.small_text_black.copyWith(fontSize: 14,color: AppColor.normalTextColor.withOpacity(0.6)),)),


                        ],
                      ),
                      customSpacerHeight(height: 4),
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
                                      style: AppStyle.normal_text_black
                                          .copyWith(
                                              color: AppColor.normalTextColor
                                                  .withOpacity(0.5),
                                              fontSize:
                                                  Dimensions.fontSizeDefault +
                                                      1),
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
                                      color: AppColor.normalTextColor
                                          .withOpacity(0.5),
                                    ),
                                    items: createPostController.items
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                                        : createPostController
                                            .selectedFloorValue.value,
                                    hint: Text(
                                      "Floor no.",
                                      style: AppStyle.normal_text_black
                                          .copyWith(
                                              color: AppColor.normalTextColor
                                                  .withOpacity(0.5),
                                              fontSize:
                                                  Dimensions.fontSizeDefault +
                                                      1),
                                    ),
                                    onChanged: (newValue) {
                                      createPostController
                                          .setSelectedFloor(newValue!);
                                    },
                                    isExpanded: true,
                                    underline: Container(),
                                    style: AppStyle.normal_text_black
                                        .copyWith(fontSize: 14),
                                    icon: Icon(
                                      Icons.expand_more,
                                      color: AppColor.normalTextColor
                                          .withOpacity(0.5),
                                    ),
                                    items: createPostController.bathRoomItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                      Obx(() => _category()),
                      customSpacerHeight(height: 20),
                      rentTextField(),
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
      ),
    );
  }

  _appbar() {
    bool hasNull= GetStorage().read(AppString.ACCESS_TOKEN) == null;
    return customAppBar(
        text: "Create post",
        prefix: GestureDetector(
          onTap: hasNull?(){} :() {
            if (_formKey.currentState!.validate()) {

              if(Get.find<CreatePostController>().selectedCity.value.isEmpty){
                showWarningMessage(message: "Please Select Your City!");
              }else if (Get
                  .find<MultiImagePickerController>()
                  .imageFileList
                  .isNotEmpty) {
                Get.find<CreatePostController>().createPost();
              } else {
                showWarningMessage(message: "Please select image!");
              }
            }
          },
          child: Card(
              elevation: 0,
              color:hasNull?AppColor.hintColor: AppColor.primaryColor,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12, top: 4, bottom: 4),
                  child: Obx(
                    () => Get.find<CreatePostController>()
                            .isLoadingCreatePost
                            .isTrue
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: AppColor.cardColor,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Create",
                            style: AppStyle.normal_text
                                .copyWith(color: AppColor.cardColor),
                          ),
                  ))),
        ));
  }

  Widget _category() {

    bool hasMatchingCategory =   Get.find<CreatePostController>().isSelectCategoryName.value.endsWith("erlor");

    // Return Container if any match is found, otherwise return GenderList
    if (hasMatchingCategory) {
      return GenderList();
    } else {
      return const SizedBox.shrink();
    }
  }

}

_cityList() {
  var controller = Get.find<CreatePostController>();
  return SizedBox(
    child: Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: AppColor.hintColor.withOpacity(0.7)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 8, bottom: 6, top: 6),
        child: Obx(() {
          print("add :: ${controller.cityListList}");
          CityListData? selectedCity;

          // Check if cityListList is not empty and selectedCity is set
          if (controller.cityListList.isNotEmpty &&
              controller.selectedCity.value.isNotEmpty) {
            // Try to find the selected city
            selectedCity = controller.cityListList.firstWhereOrNull(
                  (city) => city.name == controller.selectedCity.value,
            );
          }

          return DropdownButton<CityListData>(
            value: selectedCity,
            onChanged: (newValue) {
              controller.setSelectedDivision(newValue?.name ?? "");
              print("City ID: ${newValue?.id}, City Name: ${newValue?.name}");
              // Use newValue?.id for the API call
              controller.isSelectedCityId.value = newValue?.id.toString() ?? "";
            },
            underline: Container(),
            isExpanded: true,
            hint: Text(
              "Select city",
              style: AppStyle.normal_text_black.copyWith(
                color: AppColor.normalTextColor.withOpacity(0.5),
                fontSize: Dimensions.fontSizeDefault + 1,
              ),
            ),
            style: AppStyle.normal_text_black.copyWith(fontSize: 14),
            padding: EdgeInsets.zero,
            icon: controller.isLoadingCity.isTrue
                ? loadingIndicator()
                : const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.expand_more, color: AppColor.hintColor),
            ),
            items: controller.cityListList
                .map<DropdownMenuItem<CityListData>>((CityListData value) {
              return DropdownMenuItem<CityListData>(
                value: value,
                child: Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: AppColor.primaryColor),
                    customSpacerWidth(width: 8),
                    Text(value.name ?? "",
                        style:
                        AppStyle.normal_text_black.copyWith(fontSize: 15)),
                  ],
                ),
              );
            }).toList(),
          );
        }),
      ),
    ),
  );
}


_districtList() {
  var controller = Get.find<CreatePostController>();
  return SizedBox(
    child: Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: AppColor.hintColor.withOpacity(0.7)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 8, bottom: 6, top: 6),
        child: Obx(() {
          return DropdownButton<dis.DistrictListData>(
            value: controller.selectedDistrict.value.isNotEmpty
                ? controller.districtList.firstWhere(
                    (city) => city.name == controller.selectedDistrict.value)
                : null,
            onChanged: (newValue) {
              controller.setSelectedDistrict(newValue?.name ?? "");
              print("dis_ID: ${newValue?.id}, City Name: ${newValue?.name}");
              Get.find<CreatePostController>().getCityList(id: newValue?.id.toString());
            },
            underline: Container(),
            isExpanded: true,
            hint: Text(
              "Select district",
              style: AppStyle.normal_text_black.copyWith(
                color: AppColor.normalTextColor.withOpacity(0.5),
                fontSize: Dimensions.fontSizeDefault + 1,
              ),
            ),
            style: AppStyle.normal_text_black.copyWith(fontSize: 14),
            padding: EdgeInsets.zero,
            icon: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.expand_more, color: AppColor.hintColor),
            ),
            items: controller.districtList
                .map<DropdownMenuItem<dis.DistrictListData>>((dis.DistrictListData value) {
              return DropdownMenuItem<dis.DistrictListData>(
                value: value,
                child: Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: AppColor.primaryColor),
                    customSpacerWidth(width: 8),
                    Text(value.name ?? "",
                        style:
                            AppStyle.normal_text_black.copyWith(fontSize: 15)),
                  ],
                ),
              );
            }).toList(),
          );
        }),
      ),
    ),
  );
}
