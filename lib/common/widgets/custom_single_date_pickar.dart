import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),

      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
}
