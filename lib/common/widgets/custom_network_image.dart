import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/images.dart';


class CustomNetworkImage extends StatelessWidget {
  final String imgUrl;
  final String ?logoUrl;
  final double height;
  final Color?borderColor;
 final bool isProductImg;
   const CustomNetworkImage({super.key, this.height=32, required this.imgUrl,this.borderColor,this.logoUrl,this.isProductImg=false});
  @override
  Widget build(BuildContext context) {
    var radius = height;
    return  isProductImg==true?CachedNetworkImage(
      imageUrl:imgUrl,
      placeholder: (context, url) => const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(logoUrl??Images.user)),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(

          color: Colors.transparent,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      fit: BoxFit.cover,
    ):CircleAvatar(
      radius: radius + 2.5,
      backgroundColor: borderColor??AppColor.primaryColor,
      child: CircleAvatar(
        backgroundColor:borderColor?? AppColor.cardColor,
        radius: radius + 2,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppColor.cardColor,
          child: CachedNetworkImage(
            imageUrl:imgUrl,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage(logoUrl??Images.user)),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}