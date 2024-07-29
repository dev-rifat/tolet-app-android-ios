import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: AppColor.primaryColor.withOpacity(0.02),
        shape: roundedRectangleBorder.copyWith(side: BorderSide(width: 1,color: AppColor.primaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Icon(Icons.image_outlined,color: AppColor.normalTextColor,),
            customSpacerHeight(height: 8),
            Text("Add image",style: AppStyle.normal_text.copyWith(color: AppColor.primaryColor),),
          ],
        ),
      ),
    );
  }
}
