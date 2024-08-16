import 'package:get/get.dart';



class CreatePostController extends GetxController with StateMixin {
  final isSelectCategory = 0.obs;
  final isSelectGender = 0.obs;
  final isSelectFilter = 0.obs;

  var selectedValue = ''.obs;
  List<String> items = [
    '01',
    '02',
    '03',
    "04",
    "05",
    "06",

  ];


  var selectedBathRoomValue = ''.obs;

  List<String> bathRoomItems = [
    '01',
    '02',
    '03',
    "04",
    "05",
    "06",
  ];

    var selectedVarandaValue = ''.obs;

  List<String> varandItems = [
    '01',
    '02',
    '03',
    "04",
    "05",
    "06",
  ];

    var selectedFloorValue = ''.obs;

  List<String> floorItems = [
    '01',
    '02',
    '03',
    "04",
    "05",
    "06",
  ];


  RxList facilityList = [].obs;



  void setSelected(String value) {
    selectedValue.value = value;
  }

  void setSelectedVadanda(String value) {
    selectedVarandaValue.value = value;
  }

    void setSelectedFloor(String value) {
      selectedFloorValue .value = value;
  }



  void setSelectedBathRoom(String value) {
    selectedBathRoomValue.value = value;
  }

  var selectedDivision = "".obs;

  void setSelectedDivision(String value) {
    selectedDivision.value = value;
  }


}
