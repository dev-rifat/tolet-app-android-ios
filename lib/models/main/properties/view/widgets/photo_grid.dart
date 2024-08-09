import 'dart:math';
import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import '../../../../../utils/app_color.dart';

class PhotoGrid extends StatefulWidget {
  final int maxImages;
  final List<String> imageUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;

  const PhotoGrid(
      {required this.imageUrls,
      required this.onImageClicked,
      required this.onExpandClicked,
      this.maxImages = 2,
      Key? key})
      : super(key: key);

  @override
  createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    var images = buildImages();

    return GridView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 3.5/4
      ),
      children: images
    );
  }

  List<Widget> buildImages() {
    int numImages = widget.imageUrls.length;
    return List<Widget>.generate(min(numImages, widget.maxImages), (index) {
      String imageUrl = widget.imageUrls[index];

      // If its the last image
      if (index == widget.maxImages - 1) {
        // Check how many more images are left
        int remaining = numImages - widget.maxImages;

        // If no more are remaining return a simple image widget
        if (remaining == 0) {
          return GestureDetector(
              onTap: () => widget.onImageClicked(index),
              child: CustomNetworkImage(
                imgUrl: imageUrl,
                isRectangleImg: true,
                borderRadius: 4,

              ));
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return GestureDetector(
            onTap: () => widget.onExpandClicked(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomNetworkImage(
                  imgUrl: imageUrl,
                  isRectangleImg: true,
                  borderRadius: 4,
                ),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black54,

                    ),
                    child: Text(
                      '+$remaining',
                      style: TextStyle(
                          fontSize: 32,
                          color: AppColor.cardColor.withOpacity(0.8)),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return GestureDetector(
          child: CustomNetworkImage(
            imgUrl: imageUrl,
            isRectangleImg: true,
            borderRadius: 4,

          ),
          onTap: () => widget.onImageClicked(index),
        );
      }
    });
  }
}
