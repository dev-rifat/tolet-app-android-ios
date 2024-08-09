import 'dart:developer';
import 'package:to_let_mobile_app/common/widgets/error_message.dart';
import 'package:to_let_mobile_app/models/auth/model/error_model.dart';
import 'package:to_let_mobile_app/network/network_client.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/utils.dart';
import 'package:get/get.dart';
import '../model/categories_model.dart';
import '../model/division_list_model.dart' as city;
import '../model/search_model.dart';


class HomeController extends GetxController with StateMixin {
  final isSelectCategory = 0.obs;
  final isSelectGender = 0.obs;
  final isSelectFilter = 0.obs;

  var selectedValue = 'All'.obs;
  List<String> items = [
    'All',
    'Pending',
    'Approve',
  ];
  void setSelected(String value) {
    selectedValue.value = value;
  }

  var selectedDivision = "".obs;
  List<city.Data> divisionList = [];

  void setSelectedDivision(String value) {
    selectedDivision.value = value;
  }

  @override
  void onInit() {
    getDivisionList();
    getCategory();
    getSearchList();

    super.onInit();
  }

  ///Using model for division list
  city.DivisionListModel divisionListModel = city.DivisionListModel();
  CategoriesModel categoriesModel = CategoriesModel();
  SearchModel searchModel = SearchModel();

  Future getDivisionList() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.DIVISION_LIST,
      );
      if (response.hasError) {
        logErrorMessage(logName: "getDivisionList", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getDivisionList", response: response);
        log("getDivisionList ==> ${response.body}");
        change(null, status: RxStatus.success());
        divisionListModel = city.DivisionListModel.fromJson(response.body);

        divisionList = divisionListModel.data ?? [];
        if (divisionList.isNotEmpty) {
          selectedDivision.value = divisionList[0].name ?? "";
        }
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }


  Future getCategory() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.CATEGORY_LIST,
      );
      if (response.hasError) {
        logErrorMessage(logName: "getCategory", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getCategory", response: response);
        log("getCategory ==> ${response.body}");
        categoriesModel = CategoriesModel.fromJson(response.body);
        change(null, status: RxStatus.success());

      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }

  Future getSearchList({String ?query=""}) async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        "${Api.SERCH_POST_lIST}$query",
      );
      if (response.hasError) {
        logErrorMessage(logName: "getSearchList", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getSearchList", response: response);
        log("getSearchList ==> ${response.body}");
        searchModel = SearchModel.fromJson(response.body);
        change(null, status: RxStatus.success());

      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }

}
