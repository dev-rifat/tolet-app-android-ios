import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_let_mobile_app/common/widgets/success_message.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../network/network_client.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../utils/utils.dart';
import '../../../auth/model/error_model.dart';
import '../model/cilty_list_model.dart';
import '../model/district_model.dart';
import 'multi_image_pic_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePostController extends GetxController with StateMixin {
  final isSelectCategory = 0.obs;
  final isSelectGender = 0.obs;
  final isSelectFilter = 0.obs;
  final isSelectCategoryId = "1".obs;
  final isSelectCategoryName = "".obs;
  final isSelectedCityId = "".obs;
  final isLoadingCreatePost = false.obs;
  final isLoadingCity = false.obs;

  var selectedBedRoomValue = "02".obs;
  List<String> items = [
    '01',
    '02',
    '03',
    "04",
    "05",
    "06",
    "None",
  ];

  var selectedBathRoomValue = '02'.obs;

  List<String> bathRoomItems = ['01', '02', '03', "04", "05", "06", "None"];

  var selectedVarandaValue = '02'.obs;

  List<String> varandItems = [
    '01',
    '02',
    '03',
    "04",
    "05",
    "06",
    "None",
  ];

  var selectedFloorValue = '02'.obs;

  List<String> floorItems = [
    '01',
    '02',
    '03',
    "04",
    "05",
    "06",
    "None",
  ];

  RxList facilityList = [].obs;

  void setSelected(String value) {
    selectedBedRoomValue.value = value;
  }

  void setSelectedVadanda(String value) {
    selectedVarandaValue.value = value;
  }

  void setSelectedFloor(String value) {
    selectedFloorValue.value = value;
  }

  void setSelectedBathRoom(String value) {
    selectedBathRoomValue.value = value;
  }

  var selectedCity = "".obs;
  var selectedDistrict = "".obs;
  var selectedDistrictId = "".obs;

  void setSelectedDivision(String value) {
    selectedCity.value = value;
  }

  List<CityListData> cityListList = [];

  void setSelectedDistrict(String value) {
    selectedDistrict.value = value;
  }

  List<DistrictListData> districtList = [];

  CityListModel cityListModel = CityListModel();
  DistrictListModel districtListModel = DistrictListModel();

  @override
  void onInit() {
    if (GetStorage().read(AppString.ACCESS_TOKEN) != null) {
      getDistrictList();
    }

    super.onInit();
  }

  Future getCityList({id = ""}) async {
    isLoadingCity(true);
    try {
      Response response = await NetworkClient().postRequest(
          "${Api.cityList}?district_id=$id", {"district_id": "$id"});
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
          selectedCity.value = cityListList[0].name ?? "";
          isSelectedCityId.value = cityListList[0].id.toString() ?? "";
        }
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    isLoadingCity(false);
  }

  Future getDistrictList() async {
    isLoadingCity(true);
    try {
      Response response = await NetworkClient().getRequest(Api.districtList);
      if (response.hasError) {
        logErrorMessage(logName: "getDistrictList", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "getDistrictList", response: response);
        log("getDistrictList ==> ${response.body}");
        change(null, status: RxStatus.success());
        districtListModel = DistrictListModel.fromJson(response.body);

        districtList = districtListModel.data ?? [];
        print("id_con_${districtList[0].id.toString() ?? ""}");
        if (districtList.isNotEmpty) {
          selectedDistrict.value = districtList[0].name ?? "";
          selectedDistrictId.value = districtList[0].id.toString() ?? "";
          getCityList(id: districtListModel.data?.first.id ?? "");
        }
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    isLoadingCity(false);
  }

  Future<void> createPost() async {
    DateTime outputDate = DateTime.now();

    // Format the DateTime object to a string
    String formattedDate =
        '${outputDate.year}-${outputDate.month.toString().padLeft(2, '0')}-${outputDate.day.toString().padLeft(2, '0')}';
    print(formattedDate);

    isLoadingCreatePost(true);
    var uri = Uri.parse(Api.baseUrl + Api.createPost);

    // Create a multipart request
    var request = http.MultipartRequest('POST', uri);

    try {
      // Convert string fields to integers before adding them to the request
      request.fields['title'] = postTitleController.text;

      // Safe conversion with error handling
      try {
        request.fields['bedroom'] =
            int.parse(_count(selectedBedRoomValue.value)).toString();
        request.fields['bathroom'] =
            int.parse(_count(selectedBathRoomValue.value)).toString();
        request.fields['veranda'] =
            int.parse(_count(selectedVarandaValue.value)).toString();
        request.fields['floor_no'] =
            int.parse(_count(selectedFloorValue.value)).toString();
      } catch (e) {
        throw FormatException("Invalid number format in one of the fields: $e");
      }

      request.fields['gender'] = isSelectGender.value == 0 ? "Male" : "Female";
      request.fields['rent'] = rentController.text;
      request.fields['available_from'] = formattedDate;
      request.fields['additional_phone_number'] =
          additionalPhoneNumberController.text;
      request.fields['description'] = descriptionController.text;
      request.fields['whatsapp_number'] = whatAppNumberController.text;
      request.fields['facilities'] = jsonEncode(facilityList);
      request.fields['category_id'] = isSelectCategoryId.value.toString();
      request.fields['city_id'] = isSelectedCityId.value.toString();
      request.fields['user_id'] =
          GetStorage().read(AppString.ID_STORE).toString();
      request.fields['longitude'] =
          GetStorage().read(AppString.LONGTITUDE).toString();
      request.fields['latitude'] =
          GetStorage().read(AppString.LATITUDE).toString();

      // Add image files to the request
      RxList<ImageItem> imageFiles =
          Get.find<MultiImagePickerController>().imageFileList;
      for (var imageItem in imageFiles) {
        if (imageItem != null) {
          request.files.add(await http.MultipartFile.fromPath(
              'images[]', imageItem.file.path));
        }
      }

      // Send the request and await the response
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 || response.statusCode == 201) {
        showSuccessMessage(message: "Your Post Create Successfully");

        _clearData();

        isLoadingCreatePost(false);
      } else {
        isLoadingCreatePost(false);
        // Handle the error with detailed logging
        log('createPost Error: Status Code: ${response.statusCode}, Response: ${response.body}');
        // Optionally, show a user-friendly error message
      }
    } catch (e) {
      isLoadingCreatePost(false);
      // Log the full error details for debugging
      log('createPost Exception: $e');
      // Optionally, show a user-friendly error message
    }
  }

  void _clearData() {
    Get.find<MultiImagePickerController>().imageFileList.value = [];
    selectedBedRoomValue.value = "02";
    selectedBathRoomValue.value = "02";
    selectedVarandaValue.value = "02";
    selectedFloorValue.value = "02";
    rentController.clear();
    postTitleController.clear();
    additionalPhoneNumberController.clear();
    descriptionController.clear();
    whatAppNumberController.clear();
    rentController.clear();
    facilityList.value = [];
    isSelectCategoryId.value = "1";
    selectedDistrictId.value = "";
    getCityList();
  }

  String _count(String selectedVal) {
    if (selectedVal == "None") {
      return "0";
    } else {
      return selectedVal;
    }
  }
}
