import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/main/widgets.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../main/main.dart';
import '../../../properties/view/widgets/search_widget.dart';
import '../../controller/wishlist_controller.dart';
import '../../hive/hive_object.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
  final WishlistController controller = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        actions: [
          GestureDetector(onTap: () {}, child: const Icon(CupertinoIcons.bell)),
          customSpacerWidth(width: 12),
        ],
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 14),
          child: Text(
            "Properties",
            style:
                AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SearchWidget(),
            customSpacerHeight(height: 14),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.wishlistBox.listenable(),
                builder: (context, Box<WishlistItem> box, _) {
                  if (box.values.isEmpty) {
                    return Center(
                        child: Text(
                      'No items in wishlist.',
                      style: AppStyle.normal_text,
                    ));
                  }

                  return ListView.builder(
                    controller: hideButtonController,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      final item = box.getAt(index);
                      print("img :: ${item?.img}");
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.VIEW_DETAILS),
                            child: Card(
                              elevation: 0,
                              shape: roundedRectangleBorder.copyWith(
                                  borderRadius: BorderRadius.circular(4)),
                              color: AppColor.cardColor,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: 120,
                                    height: 110,
                                    child: CustomNetworkImage(
                                      imgUrl: "/${item?.img ?? ""}",
                                      isRectangleImg: true,
                                      borderRadius: 4,
                                    ),
                                  ),
                                  customSpacerWidth(width: 6),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item?.name ?? "",
                                            maxLines: 2,
                                            style: AppStyle.normal_text_grey
                                                .copyWith(
                                                    color: AppColor
                                                        .normalTextColor,
                                                    fontSize: Dimensions
                                                            .fontSizeDefault +
                                                        1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                          ),
                                          Text(
                                            "Tk ${item?.rent ?? ""}",
                                            style: AppStyle.normal_text_grey
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: Dimensions
                                                            .fontSizeDefault -
                                                        1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
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
                                                item?.bedroom ?? "",
                                                style: AppStyle
                                                    .normal_text_black
                                                    .copyWith(
                                                        color: AppColor
                                                            .normalTextColor
                                                            .withOpacity(0.7),
                                                        fontSize: Dimensions
                                                                .fontSizeDefault -
                                                            1,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () =>
                                          controller.deleteItem(item?.id ?? 0),
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            customSpacerHeight(height: 14),
          ],
        ),
      ),
    );
  }
}
