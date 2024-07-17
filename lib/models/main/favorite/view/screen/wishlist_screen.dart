import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';
import '../../../properties/view/widgets/search_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

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
        title: Text(
          "Properties",
          style: AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SearchWidget(),
            customSpacerHeight(height: 14),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SizedBox(
                      child: GestureDetector(
                        onTap: ()=>Get.toNamed(Routes.VIEW_DETAILS),

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
                                child: const CustomNetworkImage(
                                  imgUrl:
                                  'https://www.desmoinesregister.com/gcdn/presto/2023/03/06/PDEM/442d7d79-7525-4f5d-8c0b-e56f3b810e3b-6102_NE_Briarwood_Dr_Ankeny_IA_twilight_028.jpg?crop=1023,576,x0,y94&width=660&height=372&format=pjpg&auto=webp',
                                  isRectangleImg: true,
                                  borderRadius: 4,
                                ),
                              ),
                              customSpacerWidth(width: 6),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Orchard House",
                                        maxLines: 2,
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
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            size: 17,
                                            color: AppColor.normalTextColor.withOpacity(0.7),
                                          ),
                                          customSpacerWidth(width: 4),
                                          Expanded(
                                            child: Text(
                                              "Dhaka, BangladeshBangladeshBangladeshBangladeshBangladesh",
                                             maxLines: 2,
                                              style: AppStyle.normal_text_black.copyWith(
                                                  color: AppColor.normalTextColor.withOpacity(0.7),
                                                  fontSize: Dimensions.fontSizeDefault - 1,
                                                  overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
