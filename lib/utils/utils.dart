import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:to_let_mobile_app/models/auth/model/error_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/main/home/view/screen/home.dart';
import 'app_string.dart';
import 'images.dart';


List  get list=>_items;

List  get categoryIndex=>_categoryList;

List  get bannerIndex=>_banners;
List  get onboardImageIndex=>_onboardImage;
List  get onboardTitleIndex=>_onboardTitle;
List  get onboardDescriptionIndex=>_onboardDescription;

List<String>  get countyList=>_county;
List<String>  get username=>_reviewerName;
List<String>  get switchUser=>_switchUser;


void logErrorMessage({required String logName, Response? response}) =>
    log("${response?.statusCode} :  ${response?.request?.url.toString()}",
        name: logName, error: ErrorModel.fromJson(response?.body).message);



void logSuccessMessage(
    {required String logName, Response? response, String? message}) =>
    log("${response?.statusCode} :  ${response?.request?.url.toString()}",
        name: logName, error: message);



List _categoryList = [
  "All Category",
  "Outdoor",
  "Tennis",
  "Outdoor",
  "Tennis",
];



List<String> _reviewerName = [
  "Tracy Mosby",
  "Cherub",
  "Angelic",
  "Rifat",
  "TurboSlayer",
];


final List _banners = [
  Images.banner_1,
  Images.banner_2,
  Images.banner_3,
];

List<String> _items=[
  Images.paymet_cart_1,
  Images.paymet_cart_1,

];



final List _onboardImage = [
  Images.getOder,
  Images.confirm_oder,
  Images.payment,
];

final List _onboardTitle = [
  AppString.text_add_to_cart.tr,
  AppString.text_confirm_oder.tr,
  AppString.text_easy_safe_payment.tr,
];

final List _onboardDescription = [
  AppString.text_find_your.tr,
  AppString.text_find_your.tr,
  AppString.text_find_your.tr,
];

final screensLayoutForBtnNav = <Widget>[
  const HomeScreen(),
   Container(),
   Container(),
   Container(),
];

 List<String> _county = ['New York', 'Aurora County', 'Jones County', 'Austin County'];
 List<String> _switchUser = ['USER', 'ADMIN', 'SHOPPER',];

String formatDateTime(String dateWithTime) {
  var dateTime = DateTime.parse(dateWithTime);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.isNegative) {
    return "0 s";  // Handle negative difference by showing "0 s"
  }

  if (difference.inHours < 12) {
    // If the difference is less than 12 hours
    if (difference.inSeconds < 60) {
      return "Just now";  // Show seconds
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} m";  // Show minutes
    } else {
      return "${difference.inHours} h";  // Show hours
    }
  } else {
    // If the difference is more than 12 hours
    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}
