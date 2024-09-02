import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';

void showImageZoomDialog(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: ()=>Get.back(),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PhotoView(
              imageProvider: NetworkImage("${Api.imagePublicKey}/property/$imageUrl"),
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2.0,
              loadingBuilder: (context, event) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor, // Set your custom loader color here
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
