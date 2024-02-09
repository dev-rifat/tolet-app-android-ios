
import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool isValue = true.obs;
  RxBool isConfirmValue = true.obs;

  changeVal() {
    return isValue.value = !isValue.value;
  }
  confirmValue() {
    return isConfirmValue.value = !isConfirmValue.value;
  }
}