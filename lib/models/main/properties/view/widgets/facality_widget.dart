import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/models/main/home/view/widget/card_style.dart';
import 'package:to_let_mobile_app/models/main/properties/controller/properties_controller.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';


class FacilityWidget extends StatelessWidget {
  FacilityWidget({super.key});
final  PropertiesController controller=Get.find<PropertiesController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.propertiesModelDetails.value.data?.facilities?.length??0,
        itemBuilder: (context, index) {
          return Card(
            color: AppColor.successColor,
            elevation: 0,

            shape: roundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(controller.propertiesModelDetails.value.data?.facilities?[index].title?.toUpperCase().replaceAll("\"", "")??"",style: AppStyle.normal_text.copyWith(color: AppColor.cardColor),),
            ),
          );
        },),
    );
  }
}




Widget _buildChip({required String tag, required VoidCallback onDeleted}) {
  return Padding(
    padding: const EdgeInsets.only(left: 6.0, right: 1, top: 5),
    child: Chip(
      backgroundColor: Colors.blue,
      side: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      label: Text(
        tag,
        style: AppStyle.small_text.copyWith(fontSize: 12,color: AppColor.cardColor),
      ),

      labelStyle: AppStyle.small_text,
    ),
  );
}














List iconList=[
  const Icon( Icons.wifi,color: Colors.white,),
  const Icon( Icons.bed,color: Colors.white,),
  const Icon( Icons.gas_meter_outlined,color: Colors.white,),
  const Icon( Icons.water_drop_outlined,color: Colors.white,),
  const Icon( Icons.lightbulb_outline,color: Colors.white,),
  const Icon( Icons.tv,color: Colors.white,),
];