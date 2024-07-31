import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/common/controller/input_controller.dart';
import 'package:to_let_mobile_app/common/widgets/custom_spacer.dart';
import 'package:to_let_mobile_app/common/widgets/cutom_component/custom_title_text.dart';
import 'package:to_let_mobile_app/common/widgets/cutom_component/cutom_input_field.dart';
import 'package:to_let_mobile_app/common/widgets/cutom_component/margin_layout.dart';
import 'package:to_let_mobile_app/models/auth/view/widget/common_widget.dart';
import '../../../../../common/widgets/custom_app_bar.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_style.dart';
import '../../../home/view/widget/category_list.dart';
import '../../../main/main.dart';
import '../widget/add_image.dart';
import '../widget/gender_widget.dart';
import '../widget/text_field_widgets.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: customAppBar(text: "Create post",prefix: Card(
          elevation: 0,
          color: AppColor.primaryColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12,top: 4,bottom: 4),
            child: Text("Create",style: AppStyle.normal_text.copyWith(color: AppColor.cardColor),),
          ))),

      body: Padding(
        padding: marginLayout,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: hideButtonController,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSpacerHeight(height: 20),
              CategoryList(),
              customSpacerHeight(height: 20),

              postTitleTextField(),
              customSpacerHeight(height: 20),



              Row(
                children: [
                  Expanded(child: bedRoomTextField()),
                  customSpacerWidth(width: 20),
                  Expanded(child: bathRoomTextField())

                ],
              ),

              customSpacerHeight(height: 20),



              Row(
                children: [
                  Expanded(child: verandaTextField()),
                  customSpacerWidth(width: 20),
                  Expanded(child: floorNoTextField())

                ],
              ),
              customSpacerHeight(height: 20),

              GenderList(),

              customSpacerHeight(height: 20),
              rentTextField(),
              customSpacerHeight(height: 20),
              additionalPhoneNumberTextField(),
              customSpacerHeight(height: 20),
              descriptionTextField(),
              customSpacerHeight(height: 20),
              const AddImageWidget(),
              customSpacerHeight(height: 200),


            ],
          ),
        ),
      ),
    );
  }
}
