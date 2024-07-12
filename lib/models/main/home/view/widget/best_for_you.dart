import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';

class BestForYou extends StatelessWidget {
  const BestForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: SizedBox(
            child: Card(
              elevation: 0,
              shape: roundedRectangleBorder.copyWith(
                  borderRadius: BorderRadius.circular(12)),
              color: AppColor.cardColor,
              child: Row(
                children: [
                  Container(
                    color: Colors.transparent,
                    width: 80,
                    height: 80,
                    child: const CustomNetworkImage(
                      imgUrl:
                          'https://www.desmoinesregister.com/gcdn/presto/2023/03/06/PDEM/442d7d79-7525-4f5d-8c0b-e56f3b810e3b-6102_NE_Briarwood_Dr_Ankeny_IA_twilight_028.jpg?crop=1023,576,x0,y94&width=660&height=372&format=pjpg&auto=webp',
                      isRectangleImg: true,
                      borderRadius: 8,
                    ),
                  ),
                  customSpacerWidth(width: 6),
                  Padding(
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
                                  color:
                                      AppColor.normalTextColor.withOpacity(0.7),
                                  fontSize: Dimensions.fontSizeDefault - 1,
                                  overflow: TextOverflow.ellipsis),
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
    );
  }
}
