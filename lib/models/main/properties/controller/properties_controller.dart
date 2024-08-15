import 'dart:developer';
import 'package:get/get.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../network/network_client.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../utils/utils.dart';
import '../../../auth/model/error_model.dart';
import '../model/properies_list_model.dart';
import '../model/properties_details.dart';

class PropertiesController extends GetxController with StateMixin {


  @override
  void onInit() {
    getProperties();
    super.onInit();
  }

  String propertiesId="";

  PropertiesModel propertiesModel = PropertiesModel();
  Rx<PropertiesModelDetails> propertiesModelDetails = PropertiesModelDetails().obs;

  Future getProperties({categoryId="0"}) async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        "${Api.PEOPRTIES_lIST}?category_id=$categoryId",
      );
      if (response.hasError) {
        logErrorMessage(logName: "getProperties", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getProperties", response: response);
        log("getProperties ==> ${response.body}");
        propertiesModel = PropertiesModel.fromJson(response.body);
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }

  Future getPropertiesDetails({propertiesId="0"}) async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        "${Api.PEOPRTIES_DETAILS}$propertiesId",
      );
      if (response.hasError) {
        logErrorMessage(logName: "getPropertiesDetails", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getPropertiesDetails", response: response);
        log("getPropertiesDetails ==> ${response.body}");
        propertiesModelDetails.value = PropertiesModelDetails.fromJson(response.body);
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }
}
