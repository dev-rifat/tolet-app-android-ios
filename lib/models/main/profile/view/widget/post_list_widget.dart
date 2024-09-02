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
          (state) {
        final data = controller.myPostModel.properties?.data;

        if (data == null || data.isEmpty) {
          return Center(
            child: Text(
              "No post available here!",
              style: AppStyle.normal_text,
            ),
          );
        }

        return ListView.builder(
          controller: hideButtonController,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final property = data[index];
            return Card(
              elevation: 0,
              shape: roundedRectangleBorder.copyWith(
                borderRadius: BorderRadius.circular(12),
              ),
              color: AppColor.cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileInfo(
                      imgUrl: property.user?.image ?? "",
                      userName: property.user?.name ?? "",
                      date: formatDateTime(property.availableFrom ?? ""),
                      status: property.approvedStatus ?? "",
                    ),
                    _houseInfo(property),
                    _descriptionText(property.description ?? ""),
                    customSpacerHeight(height: 14),
                    _houseImage(property.images ?? []),
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
      ),
    );
  }

  Widget _buildProfileInfo({
    required String imgUrl,
    required String userName,
    required String date,
    required String status,
  }) {
    return Row(
      children: [
        CustomNetworkImage(
          height: 20,
          borderColor: Colors.transparent,
          imgUrl: imgUrl,
          isProfileImg: true,

        ),
        customSpacerWidth(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: AppStyle.small_text_black.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: Dimensions.fontSizeDefault + 1,
              ),
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
                  date,
                  style: AppStyle.small_text_black.copyWith(
                    fontSize: Dimensions.fontSizeDefault,
                    color: AppColor.hintColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Card(
          elevation: 0,
          color: (status == "0"
              ? AppColor.pendingColor
              : AppColor.successColor)
              .withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              status == "0" ? "Pending" : "Approved",
              style: AppStyle.normal_text_black.copyWith(
                color: status == "0"
                    ? AppColor.pendingColor
                    : AppColor.successColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _descriptionText(String description) {
    final wordCount = description.split(' ').length;
    return Padding(
      padding: marginLayout.copyWith(left: 8, right: 4, bottom: 0, top: 0),
      child: wordCount > 20
          ? ExpandedText(text: description)
          : Text(
        description,
        style: disTextStyle,
      ),
    );
  }

  Widget _houseInfo(property) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.title ?? "",
            style: AppStyle.normal_text_grey.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "${AppString.text_bd_currency} ${property.rent ?? ""}",
            style: AppStyle.normal_text_grey.copyWith(
              color: AppColor.primaryColor,
              fontSize: Dimensions.fontSizeDefault - 1,
              overflow: TextOverflow.ellipsis,
            ),
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
                "${property.city?.district?.name ?? ""}, ${property.city?.name ?? ""}",
                style: AppStyle.normal_text_black.copyWith(
                  color: AppColor.normalTextColor.withOpacity(0.7),
                  fontSize: Dimensions.fontSizeDefault - 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _houseImage(List<dynamic> images) {
    if (images.isEmpty) {
      return const SizedBox(
        height: 220,
        child: CustomNetworkImage(
          imgUrl: "",
          isRectangleImg: true,
          borderRadius: 4,
        ),
      );
    }

    final imageUrls = images.map((image) => "/${image.title ?? ""}").toList();
    return SizedBox(
      height: 220,
      child: imageUrls.length == 1
          ? CustomNetworkImage(
        imgUrl: imageUrls.first,
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
