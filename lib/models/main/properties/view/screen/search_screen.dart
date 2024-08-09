import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../../../../../common/widgets/cutom_component/margin_layout.dart';
import '../../../home/controller/home_controller.dart';
import '../widgets/search/search_list.dart';
import '../widgets/search/search_widget.dart';

class SearchScreen extends GetView<HomeController> {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor:Colors.grey.shade100,
        title: Text("Search",style: AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid),),),
      body: Padding(
        padding: marginLayout.copyWith(left: 8,right: 8),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SearchWidget(onChanged: (value){
               controller.getSearchList(query: value);
             },),
            SearchListWidget()
          ],
        ),
      ),

    );
  }
}

