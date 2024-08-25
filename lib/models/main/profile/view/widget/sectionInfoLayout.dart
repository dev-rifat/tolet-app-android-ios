import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_spacer.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../../../../utils/dimensions.dart';



Widget sectionInfoLayout({required IconData ?icon,required text,required onAction,required BuildContext context}){
  return  InkWell(
    onTap: onAction,
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               Icon(icon,color: AppColor.primaryColor,),
              customSpacerWidth(width: 12),
              Text(text,style: AppStyle.mid_large_text.copyWith(color: Theme.of(context).colorScheme.onPrimary,fontSize: Dimensions.fontSizeMid-2),),
            ],
          ),
           Icon(Icons.arrow_forward_ios_sharp,color: AppColor.primaryColor,size: 16,),
        ],
      ),
    ),
  );
}



Widget myPostsTitleText({String? text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text ?? "",
        style: AppStyle.normal_text_grey.copyWith(
            color: AppColor.normalTextColor, fontSize: Dimensions.fontSizeMid),
      ),

    ],
  );
}
