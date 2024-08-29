import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common/widgets/error_message.dart';
import '../../../../common/widgets/success_message.dart';
import '../../../../network/network_client.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/utils.dart';
import '../model/my_post_model.dart';
import '../model/profile_model.dart';
import 'package:http/http.dart' as http;


class ProfileController extends GetxController with StateMixin {

   Rx<ProfileModel> profileModel = ProfileModel().obs;
   MyPostModel myPostModel = MyPostModel();
   final isMyPostLoading = false.obs;
   final isImgUploadLoading = false.obs;

  @override
  void onInit() {
    GetStorage().read(AppString.ACCESS_TOKEN) == null ? Container() :getProfile();
    GetStorage().read(AppString.ACCESS_TOKEN) == null ? Container() :getMyPost();
    super.onInit();
  }
   var baseUrl = Api.baseUrl + Api.userChangeProfileImg;


  Future getProfile() async {
    change(null, status: RxStatus.loading());
    try {
      Response response = await NetworkClient()
          .getRequest("${Api.PROFLE}${GetStorage().read(AppString.ID_STORE)}");

      print("profile_res ::: ${response.body}");

      if (response.hasError) {
        logErrorMessage(logName: "profile", response: response);
      } else {
        logSuccessMessage(logName: "profile", response: response);
        log("profile ==> ${response.body}");
        change(null, status: RxStatus.success());
        profileModel.value = ProfileModel.fromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    change(null, status: RxStatus.success());
  }

  Future getMyPost() async {
    isMyPostLoading(true);
    try {
      Response response = await NetworkClient()
          .getRequest(Api.myPost);
      if (response.hasError) {
        logErrorMessage(logName: "getMyPost", response: response);
      } else {
        logSuccessMessage(logName: "getMyPost", response: response);
        log("getMyPost ==> ${response.body}");
        myPostModel = MyPostModel.fromJson(response.body);
        isMyPostLoading(false);


      }
    } catch (e) {
      isMyPostLoading(false);

      log(e.toString());
    }
  }






   Future changeImageImage({required XFile image}) async {
     isImgUploadLoading(true);

     print("img_path ::: ${image.path}");

     var url = Uri.parse(baseUrl);
     // Replace 'BEARER_TOKEN' and 'USER_ID' with your actual token and user ID
     var headers = {
       'Authorization': '${GetStorage().read(AppString.ACCESS_TOKEN)}',
     };
     // 'user_id': '${GetStorage().read(AppString.ID_STORE)}',
     var request = http.MultipartRequest('POST', url)
       ..headers.addAll(headers)
       ..files.add(await http.MultipartFile.fromPath('image', image.path));

     var response = await request.send();
     print("statusCode ::: ${response.statusCode}");

     if (response.statusCode == 200) {
       isImgUploadLoading(false);
       showSuccessMessage(
           message: AppString.text_file_upload_update_successfully.tr);
       getProfile();
     } else {
       showErrorMessage(message: "Failed to upload image");
       isImgUploadLoading(false);
     }
   }
















}

