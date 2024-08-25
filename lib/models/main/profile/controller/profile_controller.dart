import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../network/network_client.dart';
import '../../../../utils/api_endpoints.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/utils.dart';
import '../model/my_post_model.dart';
import '../model/profile_model.dart';


class ProfileController extends GetxController with StateMixin {

   ProfileModel profileModel = ProfileModel();
   MyPostModel myPostModel = MyPostModel();

  @override
  void onInit() {
    GetStorage().read(AppString.ACCESS_TOKEN) == null ? Container() :getProfile();
    GetStorage().read(AppString.ACCESS_TOKEN) == null ? Container() :getMyPost();
    super.onInit();
  }


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
        profileModel = ProfileModel.fromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    change(null, status: RxStatus.success());
  }

  Future getMyPost() async {
    try {
      Response response = await NetworkClient()
          .getRequest(Api.myPost);

      print("getMyPost_res ::: ${response.body}");

      if (response.hasError) {
        logErrorMessage(logName: "getMyPost", response: response);
      } else {
        logSuccessMessage(logName: "getMyPost", response: response);
        log("getMyPost ==> ${response.body}");
        myPostModel = MyPostModel.fromJson(response.body);

      }
    } catch (e) {
      log(e.toString());
    }
  }
}

