import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:to_let_mobile_app/common/widgets/no_internet.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final isDialogIsOpened = false.obs;

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(
            (connectivityResult) => _updateConnectivity(connectivityResult.first));
    super.onInit();
  }

  void _updateConnectivity(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      isDialogIsOpened(true);
      Get.to(const NoInternetScreen());
      log("Network==> Not Connected");
    } else {
      log("Network==> Connected");
      Get.back();
      isDialogIsOpened(false);
    }
  }
}