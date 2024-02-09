import 'package:to_let_mobile_app/common/controller/input_controller.dart';
import 'package:get/get.dart';

class CountryPickerController extends GetxController {
  final InputController _inputTextFieldController = Get.put(InputController());

  void setSelectedCountry(String country) {
    _inputTextFieldController.addCountyController.text = country;
  }
}
