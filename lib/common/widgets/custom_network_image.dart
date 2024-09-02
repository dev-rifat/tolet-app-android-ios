import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/models/main/home/controller/home_controller.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/app_color.dart';
import '../../utils/images.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imgUrl;
  final String? errorImg;
  final double height;
  final double? borderRadius;
  final bool isProfileImg;
  final Color? borderColor;
  final bool isRectangleImg;
  final BorderRadius? customBorderRadius;

  const CustomNetworkImage({
    super.key,
    this.height = 32,
    required this.imgUrl,
    this.borderRadius,
    this.isProfileImg = false,
    this.borderColor,
    this.customBorderRadius,
    this.errorImg,
    this.isRectangleImg = false,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    controller.imgKey.value = isProfileImg
        ? "${Api.imagePublicKey}/profile_images/$imgUrl"
        : "${Api.imagePublicKey}/property/$imgUrl";

    if (isRectangleImg) {
      return CachedNetworkImage(
        imageUrl: controller.imgKey.value,
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildErrorImage(),
        imageBuilder: (context, imageProvider) =>
            _buildRectangleImage(imageProvider),
      );
    } else {
      return _buildCircleAvatar(
        controller.imgKey.value,
      );
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            customBorderRadius ?? BorderRadius.circular(borderRadius ?? 0),
        image: DecorationImage(
          image: AssetImage(errorImg ?? AppImages.placeholder),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(child: CupertinoActivityIndicator()),
    );
  }

  Widget _buildErrorImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            customBorderRadius ?? BorderRadius.circular(borderRadius ?? 0),
        image: DecorationImage(
          image: AssetImage(errorImg ?? AppImages.placeholder),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRectangleImage(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius:
            customBorderRadius ?? BorderRadius.circular(borderRadius ?? 0),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(String imgKey) {
    final radius = height;
    return CircleAvatar(
      radius: radius + 2.5,
      backgroundColor: borderColor ?? AppColor.primaryColor,
      child: CircleAvatar(
        radius: radius + 2,
        backgroundColor: borderColor ?? AppColor.cardColor,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppColor.cardColor,
          child: CachedNetworkImage(
            imageUrl: imgKey,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => _buildCircleErrorImage(),
            imageBuilder: (context, imageProvider) =>
                _buildCircleImage(imageProvider),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleErrorImage() {
    return CircleAvatar(
      backgroundColor: AppColor.hintColor.withOpacity(0.5),
      radius: height,
      child: const Icon(
        Icons.person,
        color: AppColor.cardColor,
      ),
    );
  }

  Widget _buildCircleImage(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
