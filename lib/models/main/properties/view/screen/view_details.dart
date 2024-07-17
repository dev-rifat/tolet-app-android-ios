import 'package:flutter/material.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../widgets/facality_widget.dart';
import '../widgets/slider_view_details.dart';


class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details",style: AppStyle.small_text.copyWith(fontSize: 15),),),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              BuildImageSliderLayout(),
              _titleText(),
              sizedBox(8),

              _address(),
              sizedBox(17),

              const Text(
                "Facilities",
                maxLines: 3,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
              sizedBox(2),

              FacilityWidget(),
              sizedBox(12),

              _description(),
              sizedBox(80),



            ],
          ),
        ),
      ),
      floatingActionButton:          _rentalBtn() ,
    );
  }

  _titleText() {
    return Text(
      "Exclusive for Meeting",
      maxLines: 3,
      style: AppStyle.title_text.copyWith(color: AppColor.normalTextColor),
    );
  }

  SizedBox sizedBox(double? value) {
    return SizedBox(
      height: value ?? 8,
    );
  }

  _address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Address",
          maxLines: 3,
          style: AppStyle.small_text
              .copyWith(color: AppColor.normalTextColor, fontSize: 14),
        ),
        _buildCustomWidget(
            icon: Icons.location_on_outlined, text: "Dhaka,Bangladesh"),
      ],
    );
  }

  _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          maxLines: 3,
          style: AppStyle.title_text
              .copyWith(color: AppColor.normalTextColor, fontSize: 14),
        ),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
          maxLines: 3,
          style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
        ),
      ],
    );
  }

  _rentalBtn() {
    return     Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Container(
        color: AppColor.cardColor,
        height: 60,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Total"),
                Text("\$45.00",style: AppStyle.title_text.copyWith(color: AppColor.normalTextColor),)
              ],
            ),
            const SizedBox(width: 40,),


            Expanded(
              child: SizedBox(
                height: 50,
                width: 80,
                child: Card(
                    color: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(8)),


                    child: Center(child: Text("Rental Now",style: AppStyle.small_text.copyWith(color: AppColor.cardColor,fontSize: 16),))),
              ),
            )


          ],
        ),
      ),
    );
  }
}

_buildCustomWidget({IconData? icon, String? text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        icon,
        size: 16,
        color: Colors.grey,
      ),
      const SizedBox(
        width: 4,
      ),
      Expanded(
          child: Text(
            "$text",
            maxLines: 3,
            style: AppStyle.small_text
                .copyWith(color: AppColor.normalTextColor.withOpacity(0.5)),
          )),
    ],
  );
}