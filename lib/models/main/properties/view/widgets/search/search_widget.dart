import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/dimensions.dart';
import '../../../../home/view/widget/card_style.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String)? onChanged; // Added onChange callback

  const SearchWidget({super.key,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Card(
        color: AppColor.hintColor.withOpacity(0.2),
        shape: roundedRectangleBorder.copyWith(
            borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        child: TextField(
          cursorColor: AppColor.normalTextColor,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Enter search",

            prefixIcon: const Icon(
              CupertinoIcons.search,
            ),
            disabledBorder: outlineInputBorder,
            hintStyle:  AppStyle.normal_text_black.copyWith(
                fontSize: Dimensions.fontSizeDefault + 2,
                color: AppColor.normalTextColor),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,

          ),
        ),
      ),
    );
  }
}

OutlineInputBorder get outlineInputBorder {
  return const OutlineInputBorder(borderSide: BorderSide.none);
}
