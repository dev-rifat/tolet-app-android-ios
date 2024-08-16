import 'dart:developer';
import 'package:get/get.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../network/network_client.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../utils/utils.dart';
import '../../../auth/model/error_model.dart';
import '../model/cilty_list_model.dart';



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

  List<CityListData> cityListList = [];

  CityListModel cityListModel = CityListModel();


  @override
  void onInit() {
    getCityList();

    super.onInit();
  }

  Future getCityList() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.CITY_LIST,
      );
      if (response.hasError) {
        logErrorMessage(logName: "getCityList", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getCityList", response: response);
        log("getCityList ==> ${response.body}");
        change(null, status: RxStatus.success());
        cityListModel = CityListModel.fromJson(response.body);

        cityListList = cityListModel.data ?? [];
        if (cityListList.isNotEmpty) {
          selectedDivision.value = cityListList[0].name ?? "";
        }
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }
}
