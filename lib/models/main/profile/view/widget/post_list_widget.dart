import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/profile/controller/profile_controller.dart';
import 'package:to_let_mobile_app/models/main/properties/view/widgets/photo_grid.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../../common/widgets/loading_effect/shimmer.dart';
import '../../../../../utils/utils.dart';
import '../../../main/main.dart';
import 'expanded_text_layout.dart';

class MyPostsWidget extends GetView<ProfileController> {
  const MyPostsWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state){
          final data = controller.myPostModel.properties?.data;

          if (data == null || data.isEmpty) {
            return Center(
                child: Text(
                  "No post available here!",
                  style: AppStyle.normal_text,
                ));
          }
          return  ListView.builder(
            controller: hideButtonController,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.myPostModel.properties?.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
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
                      _buildProfileInfo(
                          imgUrl: controller.myPostModel.properties
                              ?.data?[index].user?.image ??
                              "",
                          userName: controller.myPostModel.properties
                              ?.data?[index].user?.name ??
                              "",
                          date: formatDateTime(controller.myPostModel
                              .properties?.data?[index].availableFrom ??
                              ""),
                          status: controller.myPostModel.properties
                              ?.data?[index].approvedStatus ??
                              ""),

                      ///House info only
                      _houseInfo(index),
                      _descriptionText(controller.myPostModel.properties
                          ?.data?[index].description ??
                          ""),

                      customSpacerHeight(height: 14),

                      ///House img only
                      _houseImage(index),
                    ],
                  ),
                ),
              );
            },
          );
        },



        onLoading: const Expanded(
          child: ShimmerListEffect(
            itemHeight: 800,
            itemWidth: double.infinity,
            itemCount: 5,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            itemCardHeight: 200,
            scrollDirection: Axis.vertical,
          ),
        ));
  }

  _buildProfileInfo(
      {String? imgUrl, String? userName, String? date, String? status}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomNetworkImage(
              height: 20,
              borderColor: Colors.transparent,
              imgUrl: "$imgUrl",
            ),
            customSpacerWidth(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$userName",
                  style: AppStyle.small_text_black.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: Dimensions.fontSizeDefault + 1),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: AppColor.hintColor,
                    ),
                    customSpacerWidth(width: 4),
                    Text(
                      "$date",
                      style: AppStyle.small_text_black.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color: AppColor.hintColor),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Card(
                elevation: 0,
                color: status == "0"
                    ? AppColor.pendingColor.withOpacity(0.2)
                    : AppColor.successColor.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, bottom: 2, top: 2),
                  child: Text(
                    status == "0" ? "Pending" : "Approve",
                    style: AppStyle.normal_text_black.copyWith(
                        color: status == "0"
                            ? AppColor.pendingColor
                            : AppColor.successColor,
                        overflow: TextOverflow.ellipsis),
                  ),
                )),
          ],
        )
      ],
    );
  }

  _descriptionText(drc) {
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
    var data = controller.myPostModel.properties?.data?[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data?.title ?? "",
            style: AppStyle.normal_text_grey.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeDefault + 1,
                overflow: TextOverflow.ellipsis),
          ),
          Text(
            "${AppString.text_bd_currency} ${data?.rent ?? ""}",
            style: AppStyle.normal_text_grey.copyWith(
                color: AppColor.primaryColor,
                fontSize: Dimensions.fontSizeDefault - 1,
                overflow: TextOverflow.ellipsis),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: AppColor.pendingColor,
              ),
              customSpacerWidth(width: 4),
              Text(
                "${data?.city?.district?.name ?? ""}, ${data?.city?.name ?? ""}",
                style: AppStyle.normal_text_black.copyWith(
                    color: AppColor.normalTextColor.withOpacity(0.7),
                    fontSize: Dimensions.fontSizeDefault - 1,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _houseImage(int index) {
    // Fetch the images list for the current index
    final images = controller.myPostModel.properties?.data?[index].images;

    // Check if images exist and is not empty
    if (images == null || images.isEmpty) {
      // Handle case where there are no images
      return const SizedBox(
        height: 220,
        child: CustomNetworkImage(
          imgUrl: "",
          isRectangleImg: true,
          borderRadius: 4,
        ),
      );
    }

    // Get the URL of the first image as the primary image URL
    final imageUrl = images.first.title ?? "";
    final fullImageUrl = "/$imageUrl";

    // Prepare list of image URLs
    final imageUrls = images.map((image) => "/${image.title ?? ""}").toList();
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
              onImageClicked: (index) {},
              onExpandClicked: () => print('Expand Image was clicked'),
              maxImages: 2,
            ),
    );
  }
}
