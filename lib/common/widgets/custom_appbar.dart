import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/app_layout.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/images.dart';
import 'package:to_let_mobile_app/common/widgets/custom_network_image.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_color.dart';
import '../../utils/dimensions.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: .5,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: _leadingProfile(),
      leadingWidth: AppLayout.getHeight(70),
      title: Text(
        "Hi, ${greeting()}",
        style: AppStyle.normal_text_grey.copyWith(
            fontSize: Dimensions.fontSizeMid, color: AppColor.normalTextColor),
      ),
      actions: [
        customSpacerWidth(width: 12),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              padding: iconButtonEdgeInsets,
              onPressed: () async {
                Get.toNamed(Routes.NOTIFICATION_SCREEN);
              },
              icon: icon,
            ),
          ],
        ),
      ],
      elevation: .0,
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return ' Good evening';
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 46);
}

_leadingProfile() {
  return CustomNetworkImage(
    imgUrl: "",
    errorImg: Images.user,
  );
}

EdgeInsets get leadingEdgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(18), bottom: AppLayout.getHeight(8));
}

EdgeInsets get iconButtonEdgeInsets {
  return EdgeInsets.only(bottom: AppLayout.getHeight(8));
}

Stack get icon {
  return Stack(
    children: [
      GestureDetector(
        onTap: () => Get.toNamed(Routes.NOTIFICATION_SCREEN),
        child: Icon(
          Icons.notifications_none,
          color: AppColor.primaryColor,
          size: Dimensions.fontSizeExtraLarge + 6,
        ),
      ),
      Positioned(right: 3, child: circleIcon)
    ],
  );
}

Icon get circleIcon {
  return Icon(
    Icons.circle,
    color: Colors.red,
    size: AppLayout.getHeight(10),
  );
}
