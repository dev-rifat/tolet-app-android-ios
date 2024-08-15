import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/models/main/properties/controller/properties_controller.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';

class BuildImageSliderLayout extends GetView<PropertiesController> {
  BuildImageSliderLayout({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => SizedBox(
          height: MediaQuery.of(context).size.height / 2.2,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: controller
                                .propertiesModelDetails.value.data?.images?.length ??
                            0,
                        itemBuilder: (context, index) {
                          return CustomNetworkImage(
                            isRectangleImg: true,
                            imgUrl: controller.propertiesModelDetails.value.data
                                    ?.images?[index].title ??
                                "",
                            borderRadius: 20,
                          );
                        })),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: controller
                            .propertiesModelDetails.value.data?.images?.length ??
                        0,
                    effect: const WormEffect(
                      dotHeight: 9,
                      dotWidth: 9,
                      type: WormType.thin,
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
