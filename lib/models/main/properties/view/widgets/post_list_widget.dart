import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/properties/view/widgets/photo_grid.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../favorite/controller/wishlist_controller.dart';
import '../../../favorite/hive/hive_object.dart';
import '../../../main/main.dart';
import '../../../profile/view/widget/expanded_text_layout.dart';

class PostListWidget extends StatelessWidget {
  PostListWidget({super.key});

  final WishlistController controller = Get.put(WishlistController());
  var nameList = [
    "Rifat Hasan",
    "Rifat Hasan 2",
    "Rifat Hasan 3",
    "Rifat Hasan 4",
    "Rifat Hasan 5"
  ];
  var idList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: hideButtonController,
        itemCount: nameList.length,
        itemBuilder: (context, index) {
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
                    _houseInfo(),
                    _descriptionText(),

                    customSpacerHeight(height: 14),

                    ///House img only
                    _houseImage(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildProfileInfo(index) {
    late Box<WishlistItem> wishlistBox;
    wishlistBox = Hive.box<WishlistItem>('wishlist');

    // Using RxBool to ensure reactivity
    final exists = RxBool(wishlistBox.values.any((item) => item.id == idList[index]));
    print("exists :: $exists");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CustomNetworkImage(
              height: 20,
              borderColor: Colors.transparent,
              imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTljNxaJeX5ZRS3t9wgRC2GQ0xJHlOmGLinYnz4RS2y3Gnmhb6BcxQJzDvwU-PWfVfXXFs&usqp=CAU",
            ),
            customSpacerWidth(width: 8),
            Column(
              children: [
                Text(
                  nameList[index],
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
                      "6 Apr 2023",
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
                  controller.deleteItem(idList[index]);
                } else {
                  // Add item to wishlist
                  controller.addItem(
                      id: idList[index],
                      name: nameList[index],
                      description: nameList[index]);
                }

                // Update exists status
                exists.value = wishlistBox.values
                    .any((item) => item.id == idList[index]);
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


  _descriptionText() {
    var drc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book";
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
          style: AppStyle.mid_large_text.copyWith(color: AppColor.primaryColor),
        ),
      );
    }
  }

  _houseInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Orchard House",
            style: AppStyle.normal_text_grey.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeDefault + 1,
                overflow: TextOverflow.ellipsis),
          ),
          Text(
            "\$400 / year",
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
                "6 Bedroom",
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

  _houseImage() {
    var urls = <String>[
      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    ];

    return SizedBox(
      height: 220,
      child: PhotoGrid(
        imageUrls: urls,
        onImageClicked: (i) {
          Get.toNamed(Routes.VIEW_DETAILS);
        },
        onExpandClicked: () => print('Expand Image was clicked'),
        maxImages: 2,
      ),
    );
  }
}
