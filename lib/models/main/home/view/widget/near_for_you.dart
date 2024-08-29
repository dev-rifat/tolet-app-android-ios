import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/models/main/home/controller/home_controller.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/properties/controller/properties_controller.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../common/widgets/loading_effect/shimmer.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';

class NearForYou extends GetView<HomeController> {
  const NearForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: controller.obx(
            (state) {
          final properties = controller.nearByModel.properties?.data;

          if (properties == null || properties.isEmpty) {
            return Center(
              child: Text(
                "No nearby properties found!",
                style: AppStyle.normal_text_black,
              ),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final data = properties[index];
              final imageUrl = (data.images?.isNotEmpty ?? false)
                  ? data.images![0].title ?? ""
                  : "";

              return GestureDetector(
                onTap: () {
                  final propertiesController = Get.find<PropertiesController>();
                  final propertiesId = data.id;

                  if (propertiesId != null) {
                    propertiesController.getPropertiesDetails(propertiesId: propertiesId);
                    Get.toNamed(Routes.VIEW_DETAILS);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 230,
                        child: CustomNetworkImage(
                          imgUrl: imageUrl,
                          isRectangleImg: true,
                          borderRadius: Dimensions.radiusDefault,
                        ),
                      ),
                      Positioned(
                        bottom: -4,
                        left: -5,
                        right: -5,
                        child: Card(
                          elevation: 0,
                          color: AppColor.normalTextColor.withOpacity(0.4),
                          shape: roundedRectangleBorder.copyWith(
                              borderRadius: BorderRadius.only(
                                  bottomRight:
                                  Radius.circular(Dimensions.radiusDefault),
                                  bottomLeft:
                                  Radius.circular(Dimensions.radiusDefault))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title ?? "Unknown",
                                  style: AppStyle.normal_text_black.copyWith(
                                    color: AppColor.cardColor,
                                    fontSize: Dimensions.fontSizeMid - 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      size: 14,
                                      color: AppColor.pendingColor,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${data.city?.district?.districtName ?? "Unknown District"}, ${data.city?.cityName ?? "Unknown City"}",
                                        style: AppStyle.normal_text_black.copyWith(
                                          color: AppColor.cardColor,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        onLoading: const ShimmerListEffect(
          itemHeight: 100,
          itemWidth: 200,
          itemCount: 5,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          itemCardHeight: 200,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
