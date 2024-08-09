import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/common/widgets/loading_effect/shimmer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/properties/view/widgets/photo_grid.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../../utils/utils.dart';
import '../../../favorite/controller/wishlist_controller.dart';
import '../../../favorite/hive/hive_object.dart';
import '../../../main/main.dart';
import '../../../profile/view/widget/expanded_text_layout.dart';
import '../../controller/properties_controller.dart';

class PostListWidget extends GetView<PropertiesController> {
  PostListWidget({super.key});

  final WishlistController wishlistController = Get.put(WishlistController());
  // var nameList = [
  //   "Rifat Hasan",
  //   "Rifat Hasan 2",
  //   "Rifat Hasan 3",
  //   "Rifat Hasan 4",
  //   "Rifat Hasan 5"
  // ];
  //var idList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          controller: hideButtonController,
          itemCount: controller.propertiesModel.data?.properties?.length,
          itemBuilder: (context, index) {
            var data = controller.propertiesModel.data?.properties;
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.VIEW_DETAILS),
              child: Card(
                elevation: 0,
                shape: roundedRectangleBorder.copyWith(
                    borderRadius: BorderRadius.circular(12)),
                color: AppColor.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///user profile info only
                      _buildProfileInfo(index),

                      ///House info only
                      _houseInfo(index),
                      _descriptionText(index),

                      customSpacerHeight(height: 14),

                      ///House img only
                      _buildHouseImage(index),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      onLoading: const ShimmerListEffect(),
    );
  }

  _buildProfileInfo(index) {
    late Box<WishlistItem> wishlistBox;
    wishlistBox = Hive.box<WishlistItem>('wishlist');

    // Using RxBool to ensure reactivity
    final exists = RxBool(wishlistBox.values.any((item) =>
        item.id == controller.propertiesModel.data?.properties?[index].id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              height: 20,
              borderColor: Colors.transparent,
              imgUrl: controller
                      .propertiesModel.data?.properties?[index].user?.image ??
                  "",
            ),
            customSpacerWidth(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.propertiesModel.data?.properties?[index].user
                          ?.name ??
                      "",
                  style: AppStyle.small_text_black.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: Dimensions.fontSizeDefault + 1),
                ),
                Row(
                  children: [
                   formatDateTime(
                      controller.propertiesModel.data?.properties?[index]
                          .availableFrom ??
                          "",
                    ).endsWith("s") ||formatDateTime(
                      controller.propertiesModel.data?.properties?[index]
                          .availableFrom ??
                          "",
                    ).endsWith("now")


                    ||  formatDateTime(
                          controller.propertiesModel.data?.properties?[index]
                              .availableFrom ??
                              "",
                        ).endsWith("m")||  formatDateTime(
                      controller.propertiesModel.data?.properties?[index]
                          .availableFrom ??
                          "",
                    ).endsWith("h")


                    ? const Icon(
                      Icons.access_time_sharp,
                      size: 13,
                      color: AppColor.hintColor,
                    ):
                    const Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: AppColor.hintColor,
                    ),
                    customSpacerWidth(width: 4),
                    Text(
                      formatDateTime(
                        controller.propertiesModel.data?.properties?[index]
                                .availableFrom ??
                            "",
                      ),

                      style: AppStyle.small_text_black.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color: AppColor.hintColor),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Obx(() => GestureDetector(
                  onTap: () {
                    if (exists.value) {
                      // Remove item from wishlist
                      wishlistController.deleteItem(controller
                              .propertiesModel.data?.properties?[index].id ??
                          0);
                    } else {
                      // Add item to wishlist
                      wishlistController.addItem(
                          id: controller.propertiesModel.data
                                  ?.properties?[index].id ??
                              0,
                          name: controller.propertiesModel.data
                                  ?.properties?[index].title ??
                              "No added yet",
                          rent: controller.propertiesModel.data
                                  ?.properties?[index].rent ??
                              "o",

                        bedroom: controller.propertiesModel.data
                                  ?.properties?[index].bedroom ??
                              "0",

                        img: controller.propertiesModel.data
                                  ?.properties?[index].images?.first.title ??
                              "0",
                      );
                    }

                    // Update exists status
                    exists.value = wishlistBox.values.any((item) =>
                        item.id ==
                        controller.propertiesModel.data?.properties?[index].id);
                  },
                  child: exists.value
                      ? Icon(
                          Icons.favorite,
                          color: AppColor.primaryColor,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: AppColor.primaryColor,
                        ),
                ))
          ],
        )
      ],
    );
  }

  _descriptionText(index) {
    var drc =
        controller.propertiesModel.data?.properties?[index].description ?? "";
    final wordCount = drc.split(' ').length;
    if (wordCount > 20) {
      return Padding(
        padding: marginLayout.copyWith(left: 8, right: 4, bottom: 0, top: 0),
        child: ExpandedText(
          text: drc,
        ),
      );
    } else {
      return Padding(
        padding: marginLayout.copyWith(left: 8, right: 4, bottom: 0, top: 0),
        child: Text(
          drc,
          style: disTextStyle,
        ),
      );
    }
  }

  _houseInfo(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.propertiesModel.data?.properties?[index].title ??
                "No added yet",
            style: AppStyle.normal_text_grey.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeDefault + 1,
                overflow: TextOverflow.ellipsis),
          ),
          Text(
            "${AppString.text_bd_currency} ${controller.propertiesModel.data?.properties?[index].rent ??
                "0"}",
            style: AppStyle.normal_text_grey.copyWith(
                color: AppColor.primaryColor,
                fontSize: Dimensions.fontSizeDefault - 1,
                overflow: TextOverflow.ellipsis),
          ),
          Row(
            children: [
              Icon(
                Icons.hotel_outlined,
                size: 17,
                color: AppColor.normalTextColor.withOpacity(0.7),
              ),
              customSpacerWidth(width: 4),
              Text(
                "${controller.propertiesModel.data?.properties?[index].bedroom ?? "0"} Bedroom",
                style: AppStyle.normal_text_black.copyWith(
                    color: AppColor.normalTextColor.withOpacity(0.7),
                    fontSize: Dimensions.fontSizeDefault - 1,
                    overflow: TextOverflow.ellipsis),
              ),
              _divider(),
              Icon(
                Icons.bathtub_outlined,
                size: 14,
                color: AppColor.normalTextColor.withOpacity(0.7),
              ),
              customSpacerWidth(width: 4),
              Text(
                "${controller.propertiesModel.data?.properties?[index].bathroom ?? "0"} Bathroom",
                style: AppStyle.normal_text_black.copyWith(
                    color: AppColor.normalTextColor.withOpacity(0.7),
                    fontSize: Dimensions.fontSizeDefault - 1,
                    overflow: TextOverflow.ellipsis),
              ),
              _divider(),
              Icon(
                Icons.door_sliding_outlined,
                size: 14,
                color: AppColor.normalTextColor.withOpacity(0.7),
              ),
              customSpacerWidth(width: 4),
              Expanded(
                child: Text(
                  "${controller.propertiesModel.data?.properties?[index].veranda ?? "0"} Veranda",
                  style: AppStyle.normal_text_black.copyWith(
                      color: AppColor.normalTextColor.withOpacity(0.7),
                      fontSize: Dimensions.fontSizeDefault - 1,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHouseImage(int index) {
    // Retrieve the list of images from the properties model
    final images = controller.propertiesModel.data?.properties?[index].images;

    // Get the first image's title if available
    final imageUrl =
        images?.isNotEmpty == true ? images?.first.title ?? "" : "";

    // Construct the full image URL
    final fullImageUrl = "/$imageUrl";

    // Wrap the URL in a list for PhotoGrid
    final imageUrls = [fullImageUrl];

    // Return the widget displaying the image
    return SizedBox(
      height: 220,
      child: imageUrls.length == 1
          ? CustomNetworkImage(
              imgUrl: fullImageUrl,
              isRectangleImg: true,
              borderRadius: 4,
            )
          : PhotoGrid(
              imageUrls: imageUrls,
              onImageClicked: (index) {
                Get.toNamed(Routes.VIEW_DETAILS);
              },
              onExpandClicked: () => print('Expand Image was clicked'),
              maxImages: 2,
            ),
    );
  }

  _divider() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        width: 1,
        height: 8,
        color: AppColor.hintColor,
      ),
    );
  }
}
