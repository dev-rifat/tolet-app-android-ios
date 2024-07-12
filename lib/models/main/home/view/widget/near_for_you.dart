import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_network_image.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';

class NearForYou extends StatelessWidget {

  const NearForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  width: 230,
                  child: CustomNetworkImage(
                    imgUrl:
                    'https://www.desmoinesregister.com/gcdn/presto/2023/03/06/PDEM/442d7d79-7525-4f5d-8c0b-e56f3b810e3b-6102_NE_Briarwood_Dr_Ankeny_IA_twilight_028.jpg?crop=1023,576,x0,y94&width=660&height=372&format=pjpg&auto=webp',
                    isRectangleImg: true,
                    borderRadius: Dimensions.radiusMid+2,
                  ),
                ),
                Positioned(
                    top: 4,
                    right: 6,
                    child: Card(
                      elevation: 0,
                      color: AppColor.normalTextColor.withOpacity(0.4),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.room_outlined,
                              size: 14,
                              color: AppColor.cardColor,
                            ),
                            Text(
                              "3.5 km",
                              style: AppStyle.normal_text_black
                                  .copyWith(
                                  color: AppColor.cardColor,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 15,
                    left: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dream House",
                          style: AppStyle.normal_text_black.copyWith(
                              color: AppColor.cardColor,
                              fontSize: Dimensions.fontSizeMid,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              size: 14,
                              color: AppColor.cardColor,
                            ),
                            Text(
                              "California,USA",
                              style: AppStyle.normal_text_black
                                  .copyWith(
                                  color: AppColor.cardColor,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
