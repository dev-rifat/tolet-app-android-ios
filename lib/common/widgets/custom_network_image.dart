import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/app_color.dart';
import '../../utils/images.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imgUrl;
  final String? errorImg;
  final double height;
  final double? borderRadius;
  final Color? borderColor;
  final bool isRectangleImg;
  const CustomNetworkImage(
      {super.key,
      this.height = 32,
      required this.imgUrl,
      this.borderColor,
      this.borderRadius,
      this.errorImg,
      this.isRectangleImg = false});
  @override
  Widget build(BuildContext context) {
    var radius = height;
    return isRectangleImg == true
        ? CachedNetworkImage(
            imageUrl: Api.IMGE_KEY+imgUrl,
            placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                  image: DecorationImage(
                    image: AssetImage(errorImg ?? Images.placeholder),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(child: CupertinoActivityIndicator())),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
                image: DecorationImage(
                  image: AssetImage(errorImg ?? Images.placeholder),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            fit: BoxFit.fill,
          )
        : CircleAvatar(
            radius: radius + 2.5,
            backgroundColor: borderColor ?? AppColor.primaryColor,
            child: CircleAvatar(
              backgroundColor: borderColor ?? AppColor.cardColor,
              radius: radius + 2,
              child: CircleAvatar(
                radius: radius,
                backgroundColor: AppColor.cardColor,
                child: CachedNetworkImage(
                  imageUrl: Api.IMGE_KEY+imgUrl,
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => CircleAvatar(
                    backgroundColor: AppColor.hintColor.withOpacity(0.5),

                      radius: radius,
                  child: const Icon(Icons.person,color: AppColor.cardColor,),

                  ),
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
