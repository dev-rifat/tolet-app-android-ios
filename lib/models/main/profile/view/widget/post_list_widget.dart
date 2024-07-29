import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/properties/view/widgets/photo_grid.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import 'expanded_text_layout.dart';

class MyPostsWidget extends StatelessWidget {
  const MyPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              _buildProfileInfo(),

              ///House info only
              _houseInfo(),
              _descriptionText(),

              customSpacerHeight(height: 14),

              ///House img only
              _houseImage(),
            ],
          ),
        ),
      );
    },);
  }


  _buildProfileInfo() {
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
                  "Rifat Hasan",
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
            
          Card(
             elevation: 0,
              color: AppColor.pendingColor.withOpacity(0.2),

              child:  Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 2,top: 2),
                child: Text("Pending",style: AppStyle.normal_text_black.copyWith(color: AppColor.pendingColor,overflow: TextOverflow.ellipsis),),
              )),
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
        onImageClicked: (i) => print('Image $i was clicked!'),
        onExpandClicked: () => print('Expand Image was clicked'),
        maxImages: 2,
      ),
    );
  }
}
