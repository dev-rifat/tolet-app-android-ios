import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/common/widgets/loading_effect/shimmer.dart';
import 'package:to_let_mobile_app/models/main/home/controller/home_controller.dart';
import 'package:to_let_mobile_app/models/main/properties/view/widgets/photo_grid.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../../../init_ app.dart';
import '../../../../../utils/utils.dart';
import '../../../favorite/controller/wishlist_controller.dart';
import '../../../favorite/hive/hive_object.dart';
import '../../../home/view/widget/card_style.dart';
import '../../../main/main.dart';
import '../../controller/properties_controller.dart';
import '../../../profile/view/widget/expanded_text_layout.dart';

class PostListWidget extends GetView<PropertiesController> {
  PostListWidget({super.key});

  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Expanded(
        child: _buildListView(),
      ),
      onLoading: const Expanded(
        child: ShimmerListEffect(
          itemHeight: 700,
          itemWidth: double.infinity,
          itemCount: 5,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          itemCardHeight: 200,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }

  Widget _buildListView() {
    final data = controller.propertiesModel.data;

    if (data == null || data.isEmpty) {
      return Center(
          child: Text(
        "No post available here!",
        style: AppStyle.normal_text,
      ));
    }

    return RefreshIndicator(
       onRefresh: _refreshPage,
      backgroundColor: AppColor.backgroundColor,
      color: AppColor.primaryColor,
      child: ListView.builder(
        controller: hideButtonController,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              controller.getPropertiesDetails(propertiesId: controller.propertiesModel.data?[index].id??"");
              Get.toNamed(Routes.VIEW_DETAILS);
            },
            child: Card(
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
                    _buildProfileInfo(index),
                    _houseInfo(index),
                    _descriptionText(index),
                    customSpacerHeight(height: 14),
                    _buildHouseImage(index),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Future<void> _refreshPage() async {
    await Get.find<HomeController>().getCategory();
    await controller.getProperties();
  }
  Widget _buildProfileInfo(int index) {
    final property = controller.propertiesModel.data?[index];
    final wishlistBox = Hive.box<WishlistItem>(wishListTableKey);
    final exists =
        RxBool(wishlistBox.values.any((item) => item.id == property?.id));

    // Safely retrieve the first image's title if available
    String? firstImageTitle;
    if (property?.images != null && property!.images!.isNotEmpty) {
      firstImageTitle = property.images![0].title;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(
          height: 20,
          borderColor: Colors.transparent,
          imgUrl: property?.user?.image ?? "",
        ),
        customSpacerWidth(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              property?.user?.name ?? "",
              style: AppStyle.small_text_black.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: Dimensions.fontSizeDefault + 1,
              ),
            ),
            Row(
              children: [
                _getDateTimeIcon(property?.availableFrom),
                customSpacerWidth(width: 4),
                Text(
                  formatDateTime(property?.availableFrom ?? ""),
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
        Obx(() => GestureDetector(
              onTap: () {
                if (exists.value) {
                  wishlistController.deleteItem(property?.id ?? 0);
                } else {
                  wishlistController.addItem(
                    id: property?.id ?? 0,
                    name: property?.title ?? "No added yet",
                    rent: property?.rent ?? "0",
                    bedroom: property?.districtName ?? "0",
                    img:
                        firstImageTitle ?? "", // Use the safe first image title
                  );
                }
                exists.value =
                    wishlistBox.values.any((item) => item.id == property?.id);
              },
              child: Icon(
                exists.value ? Icons.favorite : Icons.favorite_border,
                color: AppColor.primaryColor,
              ),
            )),
      ],
    );
  }

  Widget _houseInfo(int index) {
    final property = controller.propertiesModel.data?[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property?.title ?? "No added yet",
            style: AppStyle.normal_text_grey.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "${AppString.text_bd_currency} ${property?.rent ?? "0"}",
            style: AppStyle.normal_text_grey.copyWith(
              color: AppColor.primaryColor,
              fontSize: Dimensions.fontSizeDefault - 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 15,
                color: AppColor.pendingColor,
              ),
              customSpacerWidth(width: 4),
              Expanded(
                child: Text(
                  "${property?.cityName ?? ""}, ${property?.districtName ?? "Not added yet"}",
                  style: AppStyle.normal_text_black.copyWith(
                    color: AppColor.normalTextColor.withOpacity(0.7),
                    fontSize: Dimensions.fontSizeDefault - 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _descriptionText(int index) {
    final description =
        controller.propertiesModel.data?[index].description ?? "";
    final wordCount = description.split(' ').length;

    return Padding(
      padding: marginLayout.copyWith(left: 8, right: 4, bottom: 0, top: 0),
      child: wordCount > 20
          ? ExpandedText(text: description)
          : Text(description, style: disTextStyle),
    );
  }

  Widget _buildHouseImage(int index) {
    // Fetch the images list for the current index
    final images = controller.propertiesModel.data?[index].images;

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




  Widget _getDateTimeIcon(String? dateTime) {
    final formattedDateTime = formatDateTime(dateTime ?? "");
    final isRecent = formattedDateTime.endsWith("s") ||
        formattedDateTime.endsWith("now") ||
        formattedDateTime.endsWith("m") ||
        formattedDateTime.endsWith("h");

    return Icon(
      isRecent ? Icons.access_time_sharp : Icons.calendar_today,
      size: isRecent ? 13 : 12,
      color: AppColor.hintColor,
    );
  }
}
