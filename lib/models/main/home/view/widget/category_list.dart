import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                decoration: decoration,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14),
                  child: Text(
                    "Home",
                    style: AppStyle.normal_text
                        .copyWith(color: AppColor.cardColor),
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}

Decoration get decoration {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.primaryColor.withOpacity(0.5),
        AppColor.primaryColor,
        AppColor.primaryColor,
        AppColor.primaryColor,
      ],
    ),
  );
}
