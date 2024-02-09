
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_spacer.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../auth/view/widget/auth_view_widget.dart';
import 'home_view_widgets.dart';

class PopularShopLayout extends StatelessWidget {
  const PopularShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 12,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape: roundedRectangleBorder,
          child: Stack(
            children: [
              SizedBox(
                height: AppLayout.getHeight(250),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 0,
                  shape: roundedRectangleBorder,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppLayout.getHeight(150),
                        width: double.infinity,

                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(

                              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                              child: Image.asset(Images.fashion_image,fit: BoxFit.cover,)),
                        ),
                      ),
                      customSpacerHeight(height: 7),
                      Padding(
                        padding: marginLayout.copyWith(left: 4,right: 4),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customSpacerHeight(height: 4),

                            Text(
                              "Hi Tech project",
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontSize: Dimensions.fontSizeDefault+1,
                              ),
                            ),
                            customSpacerHeight(height: 4),

                            Row(
                              children: [
                                 Icon(Icons.location_on_outlined,color: AppColor.primaryColor,size: 18,),
                                Text(
                                  "Tirupur ,Dhaka block B",
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.mid_large_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault,
                                  ),
                                ),
                              ],
                            ),
                            customSpacerHeight(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,color: AppColor.primaryOrange,size: 16,),
                                Text(
                                  "(${'5'})",
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.mid_large_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Card(
                    elevation: 0,
                    shape: roundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(40)),
                    color:AppColor.hintColor.withOpacity(0.1),
                    child:  Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(Icons.favorite_border,color: AppColor.primaryColor,size: 22,),
                    ),
                  )


              ),

            ],
          ),
        );
      },);
  }
}
