import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/controller/home_controller.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../common/widgets/loading_effect/shimmer.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../properties/controller/properties_controller.dart';

class BestForYou extends GetView<HomeController> {
  const BestForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final properties = controller.bestForYouModel.properties?.data;
      if (properties == null || properties.isEmpty) {
        return Center(
            child: Text(
          "No properties available!",
          style: AppStyle.normal_text_black,
        ));
      }
      return controller.isLoadingBestForYou.isFalse
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final data = properties[index];
                final imageUrl = data.images?.isNotEmpty == true
                    ? data.images!.first.title ?? ""
                    : "";

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      final propertiesId = data.id;
                      if (propertiesId != null) {
                        Get.find<PropertiesController>()
                            .getPropertiesDetails(propertiesId: propertiesId);
                        Get.toNamed(Routes.VIEW_DETAILS);
                      }
                    },
                    child: Card(
                      elevation: 0,
                      shape: roundedRectangleBorder.copyWith(
                          borderRadius: BorderRadius.circular(12)),
                      color: AppColor.cardColor,
                      child: Row(
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: 95,
                            height: 86,
                            child: CustomNetworkImage(
                              imgUrl: imageUrl,
                              isRectangleImg: true,
                              customBorderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  topLeft: Radius.circular(6)),
                            ),
                          ),
                          customSpacerWidth(width: 6),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title ?? "",
                                  style: AppStyle.normal_text_grey.copyWith(
                                    color: AppColor.normalTextColor,
                                    fontSize: Dimensions.fontSizeDefault + 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "${AppString.text_bd_currency} ${data.rent ?? ""}",
                                  style: AppStyle.normal_text_grey.copyWith(
                                    color: AppColor.primaryColor,
                                    fontSize: Dimensions.fontSizeDefault - 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.hotel_outlined,
                                      size: 17,
                                      color: AppColor.normalTextColor
                                          .withOpacity(0.7),
                                    ),
                                    customSpacerWidth(width: 4),
                                    Text(
                                      data.bedroom ?? "",
                                      style:
                                          AppStyle.normal_text_black.copyWith(
                                        color: AppColor.normalTextColor
                                            .withOpacity(0.7),
                                        fontSize:
                                            Dimensions.fontSizeDefault - 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const ShimmerListEffect(
              itemHeight: 1000,
              itemWidth: double.infinity,
              itemCount: 5,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              itemCardHeight: 80,
              scrollDirection: Axis.vertical,
            );
    });
  }
}
