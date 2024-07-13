import 'package:flutter/material.dart';
import 'package:to_let_mobile_app/models/auth/view/widget/auth_view_widget.dart';
import 'package:to_let_mobile_app/utils/app_style.dart';
import 'package:to_let_mobile_app/utils/dimensions.dart';
import '../widgets/post_list_widget.dart';
import '../widgets/search_widget.dart';
class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor:Colors.grey.shade100,
        title: Text("Properties",style: AppStyle.title_text.copyWith(fontSize: Dimensions.fontSizeMid),),),
      body: Padding(
        padding: marginLayout.copyWith(left: 8,right: 8),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(),
            PostListWidget()
          ],
        ),
      ),

    );
  }
}

