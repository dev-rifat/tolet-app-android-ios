import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import '../../../../common/controller/input_controller.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../network/network_client.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../utils/utils.dart';
import '../../../auth/model/error_model.dart';
import '../model/cilty_list_model.dart';
import 'multi_image_pic_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePostController extends GetxController with StateMixin {
  final isSelectCategory = 0.obs;
  final isSelectGender = 0.obs;
  final isSelectFilter = 0.obs;
  final isSelectCategoryId = "".obs;
  final isSelectedCityId = "".obs;
  final isLoadingCreatePost = false.obs;

  var selectedBedRoomValue = "".obs;
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

  void setSelectedDivision(String value) {
    selectedCity.value = value;
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
          selectedCity.value = cityListList[0].name ?? "";
        }
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }

  Future<void> createPost() async {
    isLoadingCreatePost(true);
    var uri = Uri.parse(Api.BASE_URL + Api.CREATE_POST);

    // Create a multipart request
    var request = http.MultipartRequest('POST', uri);

    try {
      // Convert string fields to integers before adding them to the request
      request.fields['title'] = postTitleController.text;

      // Safe conversion with error handling
      try {
        request.fields['bedroom'] =
            int.parse(selectedBedRoomValue.value).toString();
        request.fields['bathroom'] =
            int.parse(selectedBathRoomValue.value).toString();
        request.fields['veranda'] =
            int.parse(selectedVarandaValue.value).toString();
        request.fields['floor_no'] =
            int.parse(selectedFloorValue.value).toString();
      } catch (e) {
        throw FormatException("Invalid number format in one of the fields: $e");
      }

      request.fields['gender'] = isSelectGender.value == 0 ? "Male" : "Female";
      request.fields['rent'] = rentController.text;
      request.fields['available_from'] = "2023-04-12";
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
    selectedBedRoomValue.value = "";
    selectedBathRoomValue.value = "";
    selectedVarandaValue.value = "";
    selectedFloorValue.value = "";
    rentController.clear();
    postTitleController.clear();
    additionalPhoneNumberController.clear();
    descriptionController.clear();
    whatAppNumberController.clear();
    rentController.clear();
    facilityList.value = [];
    isSelectCategoryId.value = "";
    isSelectedCityId.value = "";
  }
}
