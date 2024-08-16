import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/properties/controller/properties_controller.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/images.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/utils.dart';
import '../widgets/facality_widget.dart';
import '../widgets/slider_view_details.dart';

class ViewDetails extends GetView<PropertiesController> {
  final String? id;
  const ViewDetails({super.key, this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: AppStyle.small_text.copyWith(fontSize: 15),
        ),
        leading: IconButton(
          onPressed: () {
            controller.propertiesId = "";
            Get.back(canPop: false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: controller.obx(
          (state) => SingleChildScrollView(

            child: Column(
                  children: [
                    BuildImageSliderLayout(),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 14),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _titleText(),
                            sizedBox(8),
                            _address(),
                            sizedBox(17),
                            _facilities(),
                            sizedBox(12),
            
                            _bedRoomWithBathRoom(),
                            _varandaWithFloor(),
                            sizedBox(12),
                            _description(),
                            sizedBox(280),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          ),
          onLoading: Center(
              child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ))),
      floatingActionButton: Obx(() => _rentalBtn(context)),
    );
  }

  _titleText() {
    return Text(
      controller.propertiesModelDetails.value.data?.title ?? "",
      maxLines: 3,
      style: AppStyle.title_text.copyWith(color: AppColor.normalTextColor),
    );
  }

  SizedBox sizedBox(double? value) {
    return SizedBox(
      height: value ?? 8,
    );
  }

  _address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Address",
          maxLines: 3,
          style: AppStyle.normal_text_grey
              .copyWith(color: AppColor.normalTextColor, fontSize: 14,letterSpacing: 2),
        ),
        _buildCustomWidget(
            icon: Icons.location_on_outlined,
            text:
                "${controller.propertiesModelDetails.value.data?.cityName ?? ""}, ${controller.propertiesModelDetails.value.data?.districtName ?? ""}"),
      ],
    );
  }

  _description() {
    return Text(
      controller.propertiesModelDetails.value.data?.description ?? "",
      style: AppStyle.normal_text.copyWith(color: AppColor.normalTextColor),
    );
  }

  _rentalBtn(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Container(
        color: AppColor.cardColor,
        height: 60,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: AppStyle.normal_text_black,
                ),
                Text(
                  "${AppString.text_bd_currency} ${Get.find<PropertiesController>().propertiesModelDetails.value.data?.rent ?? "00"}",
                  style: AppStyle.title_text
                      .copyWith(color: AppColor.normalTextColor),
                )
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showRentalContactDialog(context);
                },
                child: SizedBox(
                  height: 50,
                  width: 80,
                  child: Card(
                      color: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        "Rental Now",
                        style: AppStyle.small_text
                            .copyWith(color: AppColor.cardColor, fontSize: 16),
                      ))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _facilities() {
    final facilities = controller.propertiesModelDetails.value.data?.facilities;

    if (facilities == null || facilities.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Facilities",
          maxLines: 3,
          style: AppStyle.normal_text_grey
              .copyWith(color: AppColor.normalTextColor, fontSize: 14,letterSpacing: 2),
        ),
        sizedBox(2),
        FacilityWidget(),
      ],
    );
  }

  _rentContact(imgUrl, Function onAction, number) {
    return Row(
      children: [
        GestureDetector(onTap: () => onAction(), child: Image.asset(imgUrl)),
        customSpacerWidth(width: 20),
        GestureDetector(
            onTap: () {
              copyToClipboard(number);
            },
            child: const Icon(Icons.copy)),
      ],
    );
  }

  _showRentalContactDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _rentContact(AppImages.whatApp, () {
                        launchWhatsApp(
                          phoneNumber: controller.propertiesModelDetails.value
                                  .data?.whatsappNumber ??
                              "",
                        );
                      },
                          controller.propertiesModelDetails.value.data
                                  ?.whatsappNumber ??
                              ""),
                      Container(
                        height: 50,
                        width: 2,
                        color: AppColor.hintColor.withOpacity(0.5),
                      ),
                      _rentContact(AppImages.phone, () {
                        makeLocalPhoneCall(controller.propertiesModelDetails
                                .value.data?.additionalPhoneNumber ??
                            "");
                      },
                          controller.propertiesModelDetails.value.data
                                  ?.whatsappNumber ??
                              "")
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }


_bedRoomWithBathRoom(){
    return Row(
      children: [
        _badRoomAndOther(icon: Icons.bed_outlined,staticText: "Bed room",dynamicText: controller.propertiesModelDetails.value.data?.bedroom??""),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: 1,height: 10,color: AppColor.hintColor,),
        ),
        _badRoomAndOther(icon: Icons.shower_outlined,staticText: "Bath room",dynamicText: controller.propertiesModelDetails.value.data?.bathroom??"")
      ],
    );
}
_varandaWithFloor(){
    return Row(
      children: [
        _badRoomAndOther(icon: Icons.wind_power_sharp,staticText: "Vranda",dynamicText: controller.propertiesModelDetails.value.data?.veranda??""),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: 1,height: 10,color: AppColor.hintColor,),
        ),
        _badRoomAndOther(icon: Icons.maps_home_work_outlined,staticText: "Floor",dynamicText: controller.propertiesModelDetails.value.data?.floorNo??"")
      ],
    );
}

  _badRoomAndOther({IconData?icon,String? staticText,String ?dynamicText}) {
    return Row(
      children: [
        Row(
          children: [
             Icon(
              icon,
              color: AppColor.hintColor,
              size: 16,
            ),
            customSpacerWidth(width: 4),
            Text("$staticText",style: AppStyle.normal_text_grey.copyWith(color: AppColor.normalTextColor,fontStyle: FontStyle.italic),)

          ],
        ),
        customSpacerWidth(width: 4),
        Text("- $dynamicText",style: AppStyle.normal_text_grey.copyWith(color: AppColor.primaryColor),),

      ],
    );
  }




}

_buildCustomWidget({IconData? icon, String? text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        icon,
        size: 16,
        color: Colors.orange,
      ),
      const SizedBox(
        width: 4,
      ),
      Expanded(
          child: Text(
        "$text",
        maxLines: 3,
        style: AppStyle.normal_text
            .copyWith(color: AppColor.normalTextColor.withOpacity(0.5),),
      )),
    ],
  );
}
