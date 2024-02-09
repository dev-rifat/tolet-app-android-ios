
import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';

class TopOfferLayout extends StatelessWidget {
  const TopOfferLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLayout.getWidth(125),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: _productImage(image: Images.fashion_image,placeholder:Images.fashion_image,btnLeftRadius: 8,btnRightRadius: 8),),
              ),
              Positioned(
                  bottom: 15,right: 14,
                  child: Text("20% offer",style: AppStyle.mid_large_text.copyWith(color: AppColor.cardColor,fontSize: Dimensions.fontSizeMid-3,fontWeight: FontWeight.w800),))
            ],
          );

        },),
    );
  }
  _productImage({image,placeholder,double btnLeftRadius=0,double btnRightRadius=0,}){
    return SizedBox(
      height: AppLayout.getHeight(120),
      width: AppLayout.getWidth(150),
      child: ClipRRect(
        borderRadius:  BorderRadius.only(topLeft: const Radius.circular(8),topRight: const Radius.circular(8)
            ,bottomLeft: Radius.circular(btnLeftRadius),bottomRight: Radius.circular(btnRightRadius)
        ),
        child: FadeInImage(
          image: AssetImage(image),
          placeholder: AssetImage(placeholder),
          imageErrorBuilder: (context, error, stackTrace) {
            return SizedBox(
                height: AppLayout.getHeight(110),
                width: AppLayout.getWidth(120),
                child:
                Image.asset(placeholder,fit: BoxFit.cover,));
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
