import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import '../../controller/multi_image_pic_controller.dart';

class MultiImagePickerExample extends StatelessWidget {
  MultiImagePickerExample({super.key});
  final MultiImagePickerController controller =
      Get.put(MultiImagePickerController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        children: [
          _warning(),
          GestureDetector(
            onTap: controller.pickImages,
            child: SizedBox(
              height: 54,
              child: Card(
                elevation: 0,
                color: AppColor.primaryColor,
                child: Center(
                  child: Text(
                    "Add Image",
                    style: AppStyle.normal_text_black
                        .copyWith(color: AppColor.cardColor),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return controller.imageFileList.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: controller.imageFileList.length,
                      itemBuilder: (context, index) {
                        final imageItem = controller.imageFileList[index];
                        return InkWell(
                          onLongPress: () =>
                              controller.removeImage(imageItem.id),
                          child: Image.file(
                            File(imageItem.file.path),
                            fit: BoxFit.fitWidth,
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }

  _warning() {
    return Card(
      elevation: 0,
      color: AppColor.errorColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "* Long press on an image to remove it from your selected list***",
          style: AppStyle.normal_text_black.copyWith(
              fontStyle: FontStyle.italic, color: AppColor.errorColor),
        ),
      ),
    );
  }
}
