import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/api_endpoints.dart';
import '../model/personal_date_model.dart';
import '../model/profile_model.dart';
import '../model/show_user_address_model.dart';
import '../model/succuss_model.dart';

class ProfileController extends GetxController with StateMixin {
 //  final isEditProfileLoading = true.obs;
 //  final isDeletedAddressLoading = true.obs;
 //  final isPersonalDateLoading = false.obs;
 //  final isGetAddressLoading = false.obs;
 //  final isImgUploadLoading = false.obs;
 //  final isChangePassLoading = false.obs;
 //  final isUpdatePersonalLoading = false.obs;
 //  final isAddAddressLoading = true.obs;
 //  final isLogoutLoading = false.obs;
 //  final isUpdateAddressLoading = true.obs;
 //  ProfileModel profileModel = ProfileModel();
 //  ShowUserAddressModel showUserAddressModel = ShowUserAddressModel();
 //  PersonalDateModel personalDateModel = PersonalDateModel();
 // // var baseUrl = Api.BASE_URL + Api.USER_CHANGE_PICTURE;
 //  @override
 //  void onInit() {
 //    GetStorage().read(AppString.ACCESS_TOKEN) == null ? Container() : _allApi();
 //    super.onInit();
 //  }
 //
 //
 //
 //
 //
 //
 //
 //
 //  Future getProfile() async {
 //    change(null, status: RxStatus.loading());
 //    try {
 //      Response response = await NetworkClient()
 //          .getRequest("${Api.PROFLE}${GetStorage().read(AppString.ID_STORE)}");
 //      if (response.hasError) {
 //        logErrorMessage(logName: "profile", response: response);
 //      } else {
 //        logSuccessMessage(logName: "profile", response: response);
 //        log("profile ==> ${response.body}");
 //        change(null, status: RxStatus.success());
 //        profileModel = ProfileModel.fromJson(response.body);
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    change(null, status: RxStatus.success());
 //  }
 //  Future<void> changePassword() async {
 //    print(isChangePassLoading);
 //    isChangePassLoading(true);
 //    try {
 //      Response response = await NetworkClient().putRequest(
 //          "${Api.CHANGE_PASSWORD}user_id=${GetStorage().read(AppString.ID_STORE)}&old_password=${currentPassword.text}&password=${newPasswordController.text}&confirm_password=${confirmPassController.text}",
 //          {
 //            "user_id": GetStorage().read(AppString.ID_STORE),
 //            "old_password": currentPassword.text,
 //            "password": newPasswordController.text,
 //            "confirm_password": confirmPassController.text,
 //          });
 //      print(response.body);
 //      if (response.hasError) {
 //        logErrorMessage(logName: "changePassword", response: response);
 //        showErrorMessage(message: SuccessModel.fromJson(response.body).message ?? "");
 //        isChangePassLoading(false);
 //      } else {
 //        logSuccessMessage(logName: "changePassword", response: response);
 //        showSuccessMessage(message: SuccessModel.fromJson(response.body).message ?? "Change password successfully");
 //        log("changePassword==> ${response.body}");
 //        isChangePassLoading(false);
 //        GetStorage().remove(AppString.ACCESS_TOKEN);
 //        GetStorage().remove(AppString.STORE_ADDRESS);
 //        GetStorage().remove(AppString.USER_EMAIL);
 //        GetStorage().remove(AppString.USER_PASSWORD);
 //        GetStorage().remove(AppString.ID_STORE);
 //        Get.offAllNamed(Routes.SIGN_IN);
 //        currentPassword.clear();
 //        newPasswordController.clear();
 //        confirmPassController.clear();
 //
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    isChangePassLoading(false);
 //  }
 //  Future getUserAddress() async {
 //    change(null, status: RxStatus.loading());
 //    isGetAddressLoading(true);
 //
 //    try {
 //      Response response = await NetworkClient().getRequest(
 //          "${Api.SHOW_ADDRESS}${GetStorage().read(AppString.ID_STORE)}");
 //      if (response.hasError) {
 //        logErrorMessage(logName: "ShowUserAddressModel", response: response);
 //      } else {
 //        logSuccessMessage(logName: "ShowUserAddressModel", response: response);
 //        log("ShowUserAddressModel ==> ${response.body}");
 //        showUserAddressModel = ShowUserAddressModel.fromJson(response.body);
 //        change(null, status: RxStatus.success());
 //        isGetAddressLoading(false);
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    change(null, status: RxStatus.success());
 //    isGetAddressLoading(false);
 //  }
 //
 //  Future getUserPersonalDate() async {
 //    change(null, status: RxStatus.loading());
 //    try {
 //      Response response = await NetworkClient().getRequest(
 //          Api.GET_PERSONAL_DATE_TIME +
 //              GetStorage().read(AppString.ID_STORE).toString());
 //      if (response.hasError) {
 //        logErrorMessage(logName: "getUserPersonalDate", response: response);
 //      } else {
 //        logSuccessMessage(logName: "getUserPersonalDate", response: response);
 //        log("getUserPersonalDate ==> ${response.body}");
 //        personalDateModel = PersonalDateModel.fromJson(response.body);
 //        change(null, status: RxStatus.success());
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    change(null, status: RxStatus.success());
 //  }
 //
 //  Future<void> editProfile({required imgPath}) async {
 //    isEditProfileLoading(false);
 //    try {
 //      Response response =
 //          await NetworkClient().postRequest(Api.PROFLE_UPDATED, {
 //        "user_id": GetStorage().read(AppString.ID_STORE),
 //        "first_name": editFirstNameController.text,
 //        "last_name": editLastNameController.text,
 //        "email": emailController.text,
 //        "phone_number": editPhoneController.text,
 //        "image": imgPath,
 //      });
 //      if (response.hasError) {
 //        logErrorMessage(logName: "editProfile", response: response);
 //        handleApiResponse(response.body);
 //      } else {
 //        logSuccessMessage(logName: "editProfile", response: response);
 //        showSuccessMessage(
 //            message: SuccessModel.fromJson(response.body).message ??
 //                "User updated successfully");
 //        GetStorage().read(AppString.ACCESS_TOKEN) != null ? getProfile() : null;
 //        log("editProfile==> ${response.body}");
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    isEditProfileLoading(true);
 //  }
 //
 //  Future<void> deletedAddress({required addressId}) async {
 //    isDeletedAddressLoading(false);
 //
 //    try {
 //      Response response = await NetworkClient()
 //          .deletedRequest("${Api.DELETED_ADDRESS}$addressId", {
 //        "address_id": addressId,
 //      });
 //      if (response.hasError) {
 //        logErrorMessage(logName: "deletedAddress", response: response);
 //      } else {
 //        logSuccessMessage(logName: "editProfile", response: response);
 //        showSuccessMessage(
 //            message: SuccessModel.fromJson(response.body).message ??
 //                "User updated successfully");
 //        GetStorage().read(AppString.ACCESS_TOKEN) != null
 //            ? getUserAddress()
 //            : null;
 //        log("editProfile==> ${response.body}");
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    isDeletedAddressLoading(true);
 //  }
 //
 //  Future changeImageImage({required XFile image}) async {
 //    isImgUploadLoading(true);
 //
 //    var url = Uri.parse(baseUrl);
 //    // Replace 'BEARER_TOKEN' and 'USER_ID' with your actual token and user ID
 //    var headers = {
 //      'Authorization': '${GetStorage().read(AppString.ACCESS_TOKEN)}',
 //    };
 //    // 'user_id': '${GetStorage().read(AppString.ID_STORE)}',
 //    var request = http.MultipartRequest('POST', url)
 //      ..headers.addAll(headers)
 //      ..files.add(await http.MultipartFile.fromPath('image', image.path))
 //      ..files.add(http.MultipartFile.fromString(
 //          'user_id', "${GetStorage().read(AppString.ID_STORE)}"));
 //
 //    var response = await request.send();
 //
 //    if (response.statusCode == 200) {
 //      isImgUploadLoading(false);
 //      showSuccessMessage(
 //          message: AppString.text_file_upload_update_successfully.tr);
 //      getProfile();
 //    } else {
 //      showErrorMessage(message: "Failed to upload image");
 //      isImgUploadLoading(false);
 //    }
 //  }
 //
 //  Future<void> addPersonalDate() async {
 //    isPersonalDateLoading(true);
 //    try {
 //      Response response =
 //          await NetworkClient().putRequest(Api.PERSONAL_DATE_TIME, {
 //        "user_id": GetStorage().read(AppString.ID_STORE),
 //        "personal_date":
 //            Get.find<DateTimeController>().requestedDate.value.toString(),
 //      });
 //
 //      if (response.hasError) {
 //        logErrorMessage(logName: "addPersonalDate", response: response);
 //        showErrorMessage(
 //            message:
 //                ErrorModel.fromJson(response.body).message ?? "Something wong");
 //        showErrorMessage(
 //            message:
 //                ErrorModel.fromJson(response.body).error ?? "Something wong");
 //      } else {
 //        logSuccessMessage(logName: "addPersonalDate", response: response);
 //        showSuccessMessage(
 //            message: SuccessModel.fromJson(response.body).message ??
 //                "Personal date added successfully");
 //        Get.back();
 //        getUserPersonalDate();
 //        GetStorage().read(AppString.ACCESS_TOKEN) != null ? getProfile() : null;
 //        log("editProfile==> ${response.body}");
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    isPersonalDateLoading(false);
 //  }
 //
 //  Future<void> addAddress(
 //      {required String sated,
 //      required String city,
 //      required String address,
 //      required String zip,
 //      required String id,
 //      required String county,
 //      required String latitude,
 //      required String longitude}) async {
 //    isAddAddressLoading(false);
 //    try {
 //      Response response = await NetworkClient().postRequest(Api.ADD_ADDRESS, {
 //        "user_id": GetStorage().read(AppString.ID_STORE),
 //        "address_category_id": id,
 //
 //        ///For Home(1) or office(2)
 //        "state": sated,
 //        "city": city,
 //        "street_address": address,
 //        "zip": zip,
 //        "country": county,
 //        "latitude": latitude,
 //        "longitude": longitude,
 //      });
 //
 //      if (response.hasError) {
 //        logErrorMessage(logName: "isAddAddressLoading", response: response);
 //        handleApiResponse(response.body);
 //      } else {
 //        logSuccessMessage(logName: "isAddAddressLoading", response: response);
 //        showSuccessMessage(
 //            message: SuccessModel.fromJson(response.body).message ??
 //                "Successfully added in your Address");
 //        Get.back();
 //        GetStorage().read(AppString.ACCESS_TOKEN) != null
 //            ? getUserAddress()
 //            : null;
 //        log("isAddAddressLoading==> ${response.body}");
 //
 //        stateController.clear();
 //        addressController.clear();
 //        cityController.clear();
 //        addCountyController.clear();
 //        zipController.clear();
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    isAddAddressLoading(true);
 //  }
 //
 //  Future<void> updateAddress(
 //      {required String sated,
 //      required String city,
 //      required String address,
 //      required String zip,
 //      required String county,
 //      required String id,
 //      required String categoryId,
 //      required String latitude,
 //      required String longitude}) async {
 //    isUpdateAddressLoading(false);
 //    try {
 //      Response response = await NetworkClient().putRequest(Api.UPDATE_ADDRESS, {
 //        "user_address_id": id,
 //        "address_category_id": categoryId,
 //
 //        ///Home-1 or office-2
 //        "state": sated,
 //        "city": city,
 //        "street_address": address,
 //        "zip": zip,
 //        "country": county,
 //        "latitude": latitude,
 //        "longitude": longitude,
 //      });
 //      if (response.hasError) {
 //        logErrorMessage(logName: "isUpdateAddressLoading", response: response);
 //        handleApiResponse(response.body);
 //      } else {
 //        logSuccessMessage(
 //            logName: "isUpdateAddressLoading", response: response);
 //        showSuccessMessage(
 //            message: SuccessModel.fromJson(response.body).message ??
 //                "Successfully updated in your Address");
 //        Get.back();
 //        GetStorage().read(AppString.ACCESS_TOKEN) != null
 //            ? getUserAddress()
 //            : null;
 //        log("isUpdateAddressLoading==> ${response.body}");
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    isUpdateAddressLoading(true);
 //  }
 //
 //  Future<void> logout() async {
 //    isLogoutLoading(true);
 //    try {
 //      Response response = await NetworkClient().postRequest(Api.LOGOUT, {
 //        "token": GetStorage().read(AppString.ACCESS_TOKEN),
 //      });
 //      if (response.hasError) {
 //        logErrorMessage(logName: "logout", response: response);
 //        showErrorMessage(
 //            message:
 //                ErrorModel.fromJson(response.body).error ?? "Something wong");
 //        showErrorMessage(
 //            message:
 //                ErrorModel.fromJson(response.body).message ?? "Something wong");
 //      } else {
 //        logSuccessMessage(logName: "logout", response: response);
 //        showSuccessMessage(
 //            message: SuccessModel.fromJson(response.body).message ??
 //                "Logout Successfully");
 //        log("logout==> ${response.body}");
 //        Get.offNamed(Routes.SIGN_IN);
 //        GetStorage().remove(AppString.ACCESS_TOKEN);
 //        GetStorage().remove(AppString.STORE_ADDRESS);
 //        GetStorage().remove(AppString.USER_EMAIL);
 //        GetStorage().remove(AppString.USER_PASSWORD);
 //        GetStorage().remove(AppString.ID_STORE);
 //        Get.find<SearchApiController>()
 //            .notificationModel
 //            .value
 //            .notifications
 //            ?.clear();
 //        Get.find<WishlistControllerDb>().wishlist.clear();
 //        Get.find<AddToCartDbController>().cartListDb.clear();
 //      }
 //    } catch (e) {
 //      log(e.toString());
 //    }
 //    isLogoutLoading(false);
 //  }
 //
 //  _allApi() {
 //    getProfile();
 //    getUserPersonalDate();
 //    getUserAddress();
 //  }
}

// handleApiResponse(Map<String, dynamic> response) {
//   if (response.containsKey('errors')) {
//     Map<String, dynamic> errors = response['errors'];
//
//     if (errors.containsKey('image')) {
//       String errorMessage = errors['image'][0];
//       showErrorMessage(message: errorMessage);
//     }
//
//     if (errors.containsKey('first_name')) {
//       String errorMessage = errors['first_name'][0];
//       showErrorMessage(message: errorMessage);
//     }
//
//     if (errors.containsKey('last_name')) {
//       String errorMessage = errors['last_name'][0];
//       showErrorMessage(message: errorMessage);
//     }
//     if (errors.containsKey('phone_number')) {
//       String errorMessage = errors['phone_number'][0];
//       showErrorMessage(message: errorMessage);
//     }
//     if (errors.containsKey('country')) {
//       String errorMessage = errors['country'][0];
//       showErrorMessage(message: errorMessage);
//     }
//   } else {}
// }
