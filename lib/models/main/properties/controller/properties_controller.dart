import 'dart:developer';
import 'package:get/get.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../network/network_client.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../utils/utils.dart';
import '../../../auth/model/error_model.dart';
import '../model/properies_list_model.dart';

class PropertiesController extends GetxController with StateMixin {


  @override
  void onInit() {
    getProperties();
    super.onInit();
  }

  PropertiesModel propertiesModel = PropertiesModel();

  Future getProperties() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.PEOPRTIES_lIST,
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
}
