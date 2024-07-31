import 'dart:developer';
import 'package:to_let_mobile_app/common/widgets/error_message.dart';
import 'package:to_let_mobile_app/common/widgets/success_message.dart';
import 'package:to_let_mobile_app/models/auth/model/error_model.dart';
import 'package:to_let_mobile_app/network/network_client.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/categories_model.dart';
import '../model/category_filter_model.dart';
import '../model/division_list_model.dart';
import '../model/filter_view_model.dart';
import '../model/popular_products.dart';

class HomeController extends GetxController with StateMixin {
  final isSelectCategory = 0.obs;
  final isSelectGender = 0.obs;
  final isSelectFilter = 0.obs;

  var selectedValue = 'All'.obs;
  List<String> items = ['All', 'Pending', 'Approve',];
  void setSelected(String value) {
    selectedValue.value = value;
  }

  var selectedDivision = 'Mirpur-10'.obs;
  List<dynamic> divisionItems = ['Mirpur-10', 'Dhaka', 'Tirupur',];
  void setSelectedDivision(String value) {
    selectedValue.value = value;
  }


  @override
  void onInit() {
    getDivisionList();


    super.onInit();
  }


  ///Using model for division list
  DivisionListModel divisionListModel = DivisionListModel();


  Future getDivisionList() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.DIVISION_LIST,
      );
      if (response.hasError) {
        logErrorMessage(logName: "getDivisionList", response: response);
        showErrorMessage(message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getDivisionList", response: response);
        log("getDivisionList ==> ${response.body}");
        change(null, status: RxStatus.success());
        divisionListModel = DivisionListModel.fromJson(response.body);
       // divisionItems=divisionListModel.data??[];
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }

}
